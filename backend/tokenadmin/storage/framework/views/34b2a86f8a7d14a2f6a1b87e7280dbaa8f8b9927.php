<?php $__env->startSection('content'); ?> 

<div class="content-wrapper">        
    <section class="content-header">
        <h1>Edit Investor</h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo e(route('admin::prInvestors')); ?>"><i class="fa fa-home"></i> Home</a></li>
            <li class="active">Edit Investor</li>
        </ol>
    </section>        
    <section class="content"> 
          <div class="box">                   
            <div class="box-body">
                <?php if(count($errors) > 0): ?>
                <div class="row mrb10 center-align"> 
                    <div class="alert alert-danger">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <ul>
                            <?php foreach($errors->all() as $error): ?>
                            <li><?php echo e($error); ?></li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                </div>
                <?php endif; ?>
                <?php if(session('status')): ?>
                <div class="alert alert-success fade in">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <?php echo e(session('status')); ?>

                </div>
                <?php endif; ?>
                <?php echo Form::model($oInvestor, array('route' => 'admin::InvestorFlagUpdate', 'class' => 'form-horizontal')); ?>  
                <?php echo Form::hidden('investor_id'); ?> 
                <div class="row mrb20">
                  <div class="col-md-12">
                     
                    <div class="form-group mrb20">
                      <label for="" class="control-label col-md-5">ID</label>
                      <div class="col-md-4">
                          <label style="margin-top: 5px;"><img src="<?php echo e(config('constants.NUCLEUS_UPLOAD_URL')); ?><?php echo e($oInvestor->doc1); ?>"></label>
                      </div>
                    </div>
                      
                    <div class="form-group mrb20">
                      <label for="" class="control-label col-md-5">Selfie with ID</label>
                      <div class="col-md-4">
                          <label style="margin-top: 5px;font-weight: normal;"><img src="<?php echo e(config('constants.NUCLEUS_UPLOAD_URL')); ?><?php echo e($oInvestor->doc2); ?>"></label>
                      </div>
                    </div> 
                      
                    <div class="form-group mrb20">
                      <label for="" class="control-label col-md-5">Name</label>
                      <div class="col-md-4">
                          <label style="margin-top: 5px;font-weight: normal;"><?php echo e($oInvestor->first_name." ".$oInvestor->last_name); ?></label>
                      </div>
                    </div>  
                   
                    <div class="form-group mrb20">
                      <label for="" class="control-label col-md-5">Nationality</label>
                      <div class="col-md-4">
                          <label style="margin-top: 5px;font-weight: normal;"><?php echo e($oInvestor->nationality); ?></label>
                      </div>
                    </div>
                      
                    <div class="form-group mrb20">
                      <label for="" class="control-label col-md-5">PR Flag</label>
                      <div class="col-md-4">
                          <select name="prflag" class="form-control">
							<option value="0">No</option>
							<option value="1" <?php if($oInvestor->prflag == '1'): ?> selected <?php endif; ?>>Yes</option>
						  </select>
                      </div>
                    </div>     
                    <br/>
                    <div class="form-group mrb20">
                      <label for="" class="control-label col-md-5"></label>
                      <div class="col-md-4">
                        <input class="btn btn-success btn-lg mrr20" type="submit" name="status" value="Submit"> 
                        <a href="javascript:void(0);" class="btn btn-primary btn-lg cancel">Cancel</a>
                      </div>
                    </div>  
                      
                  </div>
                </div>
               <?php echo Form::close(); ?>

            </div>
          </div>
        </section>
        <script>
            $(function () {
                $(".cancel").click(function(){ 
                   location.href="<?php echo e(route('admin::prInvestors')); ?>"; 
                });
            }); 
        </script>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>