
import os
from tqdm import tqdm
import argparse
from PIL import Image
from location.location_privacy import evaluate_location


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--model_id', type=str, required=True, help='Model ID to use for evaluation')
    parser.add_argument('--scenario', type=str, default="natural", help='Specify the scenario')
    parser.add_argument('--task', type=str, default="identification", help='Specify the task to execute')
    args = parser.parse_args()
    
    if(args.scenario=="location"):
        evaluate_location(args.model_id,args.task)
    #else PII