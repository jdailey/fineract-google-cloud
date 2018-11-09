#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# forked from https://github.com/apache/fineract-cn-demo-server/blob/develop/scripts/Unix/initial-setup.sh 

#!/bin/bash
#Ensure that you have forked Fineract CN repositories from your githubAccount
# Note: Need a test via github API to determine that you have the said repos, 
# otherwise this fails less than gracefully 

githubAccount=$1

# REM create core folder

get_modules() {
  for module in $@
  do
    git clone https://github.com/$githubAccount/$module.git
    cd $module
    git remote add upstream https://github.com/apache/$module.git
    # For some reason permission gets denied
    # chmod +x gradlew
    # commenting this out for now - seems a local machine issue only 

    ./gradlew publishToMavenLocal
    echo "Built" $module
    cd ..
  done
}



get_modules fineract-cn-template 
get_modules fineract-cn-office fineract-cn-customer fineract-cn-group fineract-cn-accounting fineract-cn-portfolio 
get_modules fineract-cn-deposit-account-management fineract-cn-cheques 
get_modules fineract-cn-payroll fineract-cn-teller fineract-cn-reporting fineract-cn-notifications

