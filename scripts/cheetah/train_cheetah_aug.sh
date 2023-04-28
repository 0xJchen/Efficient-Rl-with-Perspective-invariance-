export CUDA_DEVICE_ORDER='PCI_BUS_ID'
export CUDA_VISIBLE_DEVICES=2
for seed in 0 1 2 3 4
do
    python train.py \
        --domain_name reacher \
        --save_video \
        --task_name easy \
        --encoder_type pixel --work_dir . \
        --action_repeat 4 --num_eval_episodes 10 \
        --pre_transform_image_size 100 --image_size 108 \
        --agent RAD_SIMSIAM --frame_stack 3 --data_augs translate  \
        --seed $seed --critic_lr 1e-3 --actor_lr 1e-3 --encoder_lr 1e-3 --eval_freq 5000 --batch_size 512 --num_train_steps 26000 \
        --num_layers 4 --extra node15-2 --pred_step 3
done