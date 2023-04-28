export CUDA_DEVICE_ORDER='PCI_BUS_ID'
export CUDA_VISIBLE_DEVICES=1

for step in 1
do
    for seed in 0 1 2 3 4
    do
        for weight in 1
        do
            python train.py \
                --domain_name cheetah \
                --save_video \
                --task_name run \
                --encoder_type pixel --work_dir . \
                --action_repeat 4 --num_eval_episodes 10 \
                --pre_transform_image_size 100 --image_size 108 \
                --agent RAD_BYOL --frame_stack 3 --data_augs translate  \
                --seed $seed --critic_lr 2e-4 --actor_lr 2e-4 --encoder_lr 2e-4 --eval_freq 5000 --batch_size 512 --num_train_steps 26000 \
                --num_layers 4 --extra node17-1 --pred_step $step --weight $weight
        done 
    done
done 