#!/bin/sh
sudo curl -o ./cascadia.zip "https://objects.githubusercontent.com/github-production-release-asset-2e65be/27574418/6423efd7-c4f4-424b-8e1e-c8d1f88148d2?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240414%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240414T203333Z&X-Amz-Expires=300&X-Amz-Signature=e7ce14ebfa8eb055fd2538933ab15c2057a8d60b0516e34225a2051efb3a10dc&X-Amz-SignedHeaders=host&actor_id=94834543&key_id=0&repo_id=27574418&response-content-disposition=attachment%3B%20filename%3DCascadiaCode.zip&response-content-type=application%2Foctet-stream"
cp ./cascadia.zip /usr/share/fonts/cascadia.zip
#unzip /usr/share/fonts/cascadia.zip
#/usr/share/fonts/cascadia.zip
