for model in stabilityai/stable-diffusion-xl-base-1.0 dreamlike-art/dreamlike-photoreal-2.0 prompthero/openjourney-v4 DeepFloyd/IF-I-M-v1.0 dall-e-2 dall-e-3
do
  for dataset in occupation occupation_with_sex occupation_with_race occupation_with_age education education_with_sex education_with_race education_with_sex activity activity_with_sex
  do
    python main.py --inference_model $model --inference_gpu_id 0 --dataset $dataset --do_generation --save_dir  ./mmdt_results/fairness
  done
done

for model in stabilityai/stable-diffusion-xl-base-1.0 dreamlike-art/dreamlike-photoreal-2.0 prompthero/openjourney-v4 DeepFloyd/IF-I-M-v1.0 dall-e-2 dall-e-3
do
  for dataset in occupation occupation_with_sex occupation_with_race occupation_with_age education education_with_sex education_with_race education_with_sex activity activity_with_sex
  do
    python main.py --inference_model $model --evaluate_gpu_id 0 --dataset $dataset --do_evaluate --save_dir ./mmdt_results/fairness
  done
done

target1=occupation
target2=education
target3=activity
for model in stabilityai/stable-diffusion-xl-base-1.0 dreamlike-art/dreamlike-photoreal-2.0 prompthero/openjourney-v4 DeepFloyd/IF-I-M-v1.0 dall-e-2 dall-e-3
do
  for attr in gender race age
  do
    python main.py --inference_model $model --evaluate_gpu_id 5 --do_fairness_score_calculation --score_comp_sensitive $attr --score_comp_target $target1 --save_dir  /data1/common/mintong/mmdt_results
  done
  for attr in gender race
  do
    python main.py --inference_model $model --evaluate_gpu_id 5 --do_fairness_score_calculation --score_comp_sensitive $attr --score_comp_target $target2 --save_dir  /data1/common/mintong/mmdt_results
  done
  for attr in gender
  do
    python main.py --inference_model $model --evaluate_gpu_id 5 --do_fairness_score_calculation --score_comp_sensitive $attr --score_comp_target $target3 --save_dir  /data1/common/mintong/mmdt_results
  done
done
