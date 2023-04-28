export CUDA_DEVICE_ORDER='PCI_BUS_ID'
export CUDA_VISIBLE_DEVICES=1

for encoder_tau in 0.05
do
    for step in 1
    do
        for seed in 0 1 5 6 7 8 9
        do
            for weight in 0.5
            do
                python train.py \
                    --domain_name reacher \
                    --save_video \
                    --task_name easy \
                    --encoder_type pixel --work_dir . \
                    --action_repeat 4 --num_eval_episodes 10 \
                    --pre_transform_image_size 100 --image_size 84 \
                    --agent RAD_BYOL_DEMA --frame_stack 3 --data_augs crop  \
                    --seed $seed --critic_lr 1e-3 --actor_lr 1e-3 --encoder_lr 1e-3 --eval_freq 5000 --batch_size 512 --num_train_steps 26000 \
                    --num_layers 4 --extra node17-1 --pred_step $step --weight $weight --encoder_tau $encoder_tau
            done 
        done
    done
done