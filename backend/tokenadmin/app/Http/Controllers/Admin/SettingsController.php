<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Settings;

class SettingsController extends Controller
{
    public $apiDomain = '54.215.211.34:1337';//13.56.240.73:1337
    /**
     * @return void
     */
    public function __construct() {
        //$this->middleware('admin');  
    }

    /**
     * Data filtering.
     *
     * @return array
     */
    private function formatData(Request $request) { 
        return [
            'dt_sales_users' => \Carbon\Carbon::createFromFormat('m/d/Y h:i a', $request->dt_sales_users)->format('Y-m-d H:i:s'),
            'dt_sales_public' => \Carbon\Carbon::createFromFormat('m/d/Y h:i a', $request->dt_sales_public)->format('Y-m-d H:i:s'),
            'bonus_percentage' => $request->input('bonus_percentage'),
            'no_first_buyers' => $request->input('no_first_buyers'),
            'token_price' => $request->input('token_price'),
            'min_amount' => $request->input('min_amount'),
            'audit_period_days' => $request->input('audit_period_days'),
            'max_limit' => $request->input('max_limit'),
        ];
    }

    public function index() {
        $oSetting = Settings::first();
        return \View::make('admin.settings.index')->with('oSetting', $oSetting);

    }
    
    public function getStats(){
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,"http://".$this->apiDomain."/user/getStats");
        curl_setopt($ch, CURLOPT_POST, 1);
        //curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $server_output1 = curl_exec ($ch);
        curl_close ($ch);
        
        $aResp = ['message' => '', 'success' => '1', 'serverTime' => '-'];
        $aResp['totalEthRaised'] = '-';
        $aResp['totalTokensSold'] = '-';
        $aResp['buyersCount'] = '-';
        
        $aObj = json_decode($server_output1, true);
        if(!empty($aObj['currentTime']))$aResp['serverTime'] = date("m/d/Y h:i a", $aObj['currentTime']);
        if(!empty($aObj['status']) && $aObj['status'] == 'ok'){
            if(isset($aObj['data'][0]))$aResp['totalEthRaised'] = $this->TrimTrailingZeroes(bcdiv($aObj['data'][0], bcpow('10', '18'), 18));
            if(isset($aObj['data'][1]))$aResp['totalTokensSold'] = $aObj['data'][1];
            if(isset($aObj['data'][2]))$aResp['buyersCount'] = $aObj['data'][2];
        }
        
        $data = ['data' => $aResp, 'status' => 'ok', 'message' => ''];
        echo json_encode($data);
        exit;
    }

    public function loadIcoSettings(){
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,"http://".$this->apiDomain."/user/getSettings");
        curl_setopt($ch, CURLOPT_POST, 1);
        //curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $server_output1 = curl_exec ($ch);
        curl_close ($ch);
        
        $aResp = ['message' => '', 'success' => '1', 'serverTime' => '-'];
        $aResp['whiteTime'] = '-';
        $aResp['publicTime'] = '-';
        $aResp['endTime'] = '-';
        $aResp['lockTime'] = '-';
        $aResp['ePrice'] = '-';
        $aResp['bPrice'] = '-';
        $aResp['minEth'] = '-';
        $aResp['minGas'] = '-';
        $aResp['maxGas'] = '-';
        $aResp['minGasPrice'] = '-';
        $aResp['maxGasPrice'] = '-';
        $aResp['bonus'] = '-';
        $aResp['bonusBuyers'] = '-';
        $aResp['softCap'] = '-';
        $aResp['hardCap'] = '-';
        
        $aObj = json_decode($server_output1, true);
        if(!empty($aObj['currentTime']))$aResp['serverTime'] = date("m/d/Y h:i a", $aObj['currentTime']);
        if(!empty($aObj['status']) && $aObj['status'] == 'ok'){
            if(!empty($aObj['data'][0]))$aResp['ePrice'] = $this->TrimTrailingZeroes(bcdiv($this->EtoFull($aObj['data'][0]), bcpow('10', '18'), 18));
            if(!empty($aObj['data'][1]))$aResp['bPrice'] = $this->TrimTrailingZeroes(bcdiv($this->EtoFull($aObj['data'][1], 8), bcpow('10', '8'), 8));
            if(!empty($aObj['data'][2]))$aResp['minEth'] = $this->TrimTrailingZeroes(bcdiv($this->EtoFull($aObj['data'][2]), bcpow('10', '18'), 18));
            if(!empty($aObj['data'][3]))$aResp['minGas'] = $aObj['data'][3];
            if(!empty($aObj['data'][4]))$aResp['maxGas'] = $aObj['data'][4];
            if(!empty($aObj['data'][5]))$aResp['minGasPrice'] = $aObj['data'][5];
            if(!empty($aObj['data'][6]))$aResp['maxGasPrice'] = $aObj['data'][6];
            if(!empty($aObj['data'][7]))$aResp['bonus'] = $aObj['data'][7];
            if(!empty($aObj['data'][8]))$aResp['bonusBuyers'] = $aObj['data'][8];
            if(!empty($aObj['data'][9]))$aResp['softCap'] = $this->TrimTrailingZeroes(bcdiv($this->EtoFull($aObj['data'][9],18), bcpow('10', '18'), 18));
            if(!empty($aObj['data'][10]))$aResp['hardCap'] = $this->TrimTrailingZeroes(bcdiv($this->EtoFull($aObj['data'][10],18), bcpow('10', '18'), 18));
        }
        $server_output2 = "";
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,"http://".$this->apiDomain."/user/GetStartTimes");
        curl_setopt($ch, CURLOPT_POST, 1);
        //curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $server_output2 = curl_exec ($ch);
        curl_close ($ch);
        $aObj = json_decode($server_output2, true);
        if(!empty($aObj['data'][1]))$aResp['whiteTime'] = date("m/d/Y h:i a", $aObj['data'][1]);
        if(!empty($aObj['data'][2]))$aResp['publicTime'] = date("m/d/Y h:i a", $aObj['data'][2]);
        if(!empty($aObj['data'][3]))$aResp['endTime'] = date("m/d/Y h:i a", $aObj['data'][3]);
        if(!empty($aObj['data'][4]))$aResp['lockTime'] = $aObj['data'][4]/(24*3600);
        
        $data = ['data' => $aResp, 'status' => 'ok', 'message' => ''];
        echo json_encode($data);
        exit;
    }
    
    
    /**
     * get list of teams
     * @return json array
     */
    public function getInvestorsList() {
        return Investor::get()->toArray();
    }

    public function create() {
        return view('admin.settings.add');
    }
    
    public function TrimTrailingZeroes($nbr) {
        return strpos($nbr,'.')!==false ? rtrim(rtrim($nbr,'0'),'.') : $nbr;
    }
    
    public function EtoFull($nbr, $precision = 18) {
        
        $nbr = strtoupper($nbr);
        
        if(strpos($nbr, "E+")){
            $data = explode("E+", $nbr);
            return bcmul($data[0], bcpow('10', $data[1]), $precision);
        }
        
        if(strpos($nbr, "E-")){
            $data = explode("E-", $nbr);
            return bcdiv($data[0], bcpow('10', $data[1]), $precision);
        }
        
        return $nbr;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {
        try{

            $this->validate($request, Settings::$rules, Settings::$messages,  Settings::$customAttributeNames);
            $aData = $this->formatData($request);
            
            $oSettings = Settings::first();
            
            if($oSettings){
                $oSettings->update($aData);
            }else{
                Settings::create($aData);
            }
            
                $post = [];
                if(isset($_REQUEST['dt_sales_users']))$post[] = "whiteTime=".strtotime($_REQUEST['dt_sales_users']);
                if(isset($_REQUEST['dt_sales_public']))$post[] = "publicTime=".strtotime($_REQUEST['dt_sales_public']);
                if(isset($_REQUEST['endTime']))$post[] = "endTime=".strtotime($_REQUEST['endTime']);
                if(isset($_REQUEST['audit_period_days']))$post[] = "lockTime=".($_REQUEST['audit_period_days']*24*3600);
                if(isset($_REQUEST['token_price']))$post[] = "ePrice=".$this->TrimTrailingZeroes(bcmul($_REQUEST['token_price'], bcpow('10', '18'), 18));
                if(isset($_REQUEST['bPrice']))$post[] = "bPrice=".$this->TrimTrailingZeroes(bcmul($_REQUEST['bPrice'], bcpow('10', '8'), 8));
                if(isset($_REQUEST['min_amount']))$post[] = "minEth=".$this->TrimTrailingZeroes(bcmul($_REQUEST['min_amount'], bcpow('10', '18'), 18));

                if(isset($_REQUEST['minGas']))$post[] = "minGas=".urlencode($_REQUEST['minGas']);
                if(isset($_REQUEST['maxGas']))$post[] = "maxGas=".urlencode($_REQUEST['maxGas']);
                if(isset($_REQUEST['minGasPrice']))$post[] = "minGasPrice=".urlencode($_REQUEST['minGasPrice']);
                if(isset($_REQUEST['maxGasPrice']))$post[] = "maxGasPrice=".urlencode($_REQUEST['maxGasPrice']);

                if(isset($_REQUEST['bonus_percentage']))$post[] = "bonus=".urlencode($_REQUEST['bonus_percentage']);
                if(isset($_REQUEST['no_first_buyers']))$post[] = "bonusBuyers=".urlencode($_REQUEST['no_first_buyers']);
                if(isset($_REQUEST['softCap']))$post[] = "softCap=".$this->TrimTrailingZeroes(bcmul($_REQUEST['softCap'], bcpow('10', '18'), 18));
                if(isset($_REQUEST['hardCap']))$post[] = "hardCap=".$this->TrimTrailingZeroes(bcmul($_REQUEST['hardCap'], bcpow('10', '18'), 18));

                //print_r($post);
                //exit;
                
                if(!empty($post)){
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL,"http://".$this->apiDomain."/user/setSettings");
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, implode("&", $post));
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    $server_output = curl_exec ($ch);
                    curl_close ($ch);
/*
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL,"http://".$this->apiDomain."/user/setStartTimes");
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, implode("&", $post));
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    $server_output = curl_exec ($ch);
                    curl_close ($ch);*/
                }

            \Session::flash('status', trans('notifications.success'));
            \Session::flash('message', trans('notifications.settings.update_message'));

        }catch(\Exception $e){
            dd($e->getMessage());
            \Session::flash('status', trans('notifications.error'));
            \Session::flash('message', trans('notifications.settings.error_message'));
            return redirect()->back();
        }
        return redirect()->back();
    }
    
    /*
     * Edit Team 
     */
    public function edit($iInvestorId) {
        return view('admin.settings.edit');
                //->with('oInvestor', Investor::find($iInvestorId));
    }

    /**
     * Update the specified resource in storage.
     *
     * @return Response
     */
    public function update(Request $request) {
       
    
    }
    
    /*
     * View Team
     */
    public function view($iInvestorId) {
        
    }
    
    /*
     * Delete Team 
     */
    public function delete(Request $request) {
        
    }
}
