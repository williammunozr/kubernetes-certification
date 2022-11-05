#!/bin/bash

kubectl get pod pod1 -o jsonpath='{.status.phase}{"\n"}'
