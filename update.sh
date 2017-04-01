#!/bin/bash
rake generate
rake deploy
git add .
git commit -m 'update my blog'
git push origin source
