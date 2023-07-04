--create model predict_crab_count_main

CREATE MODEL predict_crab_count_main
FROM
  (SELECT
    sex,length,diameter,height,weight,shucked_weight,viscera_weight,shell_weight,age
FROM
     "main_crab_data"."public"."crab_dataset") TARGET age FUNCTION predict_crab_count_main
    IAM_ROLE default 
    PROBLEM_TYPE regression 
    OBJECTIVE 'mse' 
    SETTINGS (
        s3_bucket 'bucket-name',
        s3_garbage_collect off,
        max_runtime 5000
    );

-- show model
SHOW MODEL predict_crab_count_main;
