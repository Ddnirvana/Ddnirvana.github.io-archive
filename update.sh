#!/bin/bash
bundle exec rake generate
bundle exec rake deploy
git add .
git commit -m 'update my blog'
git push origin source
