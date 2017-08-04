pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''export PATH="/opt/rbenv/bin:/opt/rbenv/shims:$PATH"
eval "$(rbenv init -)"
export RBENV_ROOT=/opt/rbenv

pwd
ls -la

bundle install --binstubs
'''
      }
    }
  }
}