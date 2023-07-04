-- linear regression model
CREATE OR REPLACE MODEL `test_table.crab_model_without_id`
OPTIONS
  (model_type='linear_reg',
    input_label_cols=['Age']) AS
SELECT *EXCEPT(id) FROM `project.ml_dataset.extended_crab_age_prediction` WHERE Age IS NOT NULL;

-- AUTOML

CREATE OR REPLACE MODEL `test_table.crab_model_auto_ml`
OPTIONS
  (MODEL_TYPE='AUTOML_REGRESSOR',
    BUDGET_HOURS=1.5,
    OPTIMIZATION_OBJECTIVE='MINIMIZE_RMSE',
    input_label_cols=['Age']) AS
SELECT *EXCEPT(id) FROM `project-name.ml_dataset.extended_crab_age_prediction` WHERE Age IS NOT NULL;