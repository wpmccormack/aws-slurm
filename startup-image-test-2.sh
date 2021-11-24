#!/bin/bash
echo "The script has 0 arguments"
yum -y install wget
yum -y install epel-release
yum -y install emacs
yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
yum -y install cvmfs cvmfs-config-default cvmfs-auto-setup
sudo cvmfs_config setup
sudo echo "CVMFS_REPOSITORIES=cms.cern.ch,sft.cern.ch,grid.cern.ch,oasis.opensciencegrid.org" >> /etc/cvmfs/default.local
sudo echo 'CVMFS_HTTP_PROXY="10.0.0.171:3128|10.0.0.96:3128|10.0.0.248:3128|10.0.0.25:3128|10.0.0.181:3128|10.0.0.7:3128|10.0.0.176:3128|10.0.0.196:3128"' >> /etc/cvmfs/default.local
#sudo echo 'CVMFS_HTTP_PROXY="10.0.0.62:3128|10.0.0.143:3128|10.0.0.223:3128|10.0.0.65:3128|10.0.0.184:3128|10.0.0.40:3128|10.0.0.130:3128|10.0.0.149:3128"' >> /etc/cvmfs/default.local
#sudo echo "CVMFS_HTTP_PROXY=DIRECT" >> /etc/cvmfs/default.local
sudo cvmfs_config probe
yum -y install per15
yum -y install perl-Params-Validate
rpm -ql perl-Params-Validate
yum -y install cpan
cpan Module::Build
cpan Test::Harness::Straps
perl ./Build.PL
export SCRAM_ARCH=slc7_amd64_gcc900
source /cvmfs/cms.cern.ch/cmsset_default.sh
pwd
curr=${PWD}
mkdir /home/centos/cms_path
CMS_PATH=/home/centos/cms_path
mkdir $CMS_PATH/SITECONF/
mkdir $CMS_PATH/SITECONF/local
mkdir $CMS_PATH/SITECONF/local/JobConfig
mkdir $CMS_PATH/SITECONF/local/PhEDEx
cd $CMS_PATH/SITECONF/local/JobConfig
wget https://patrick-test-1.s3.amazonaws.com/site-local-config.xml
cd
cd $CMS_PATH/SITECONF/local/PhEDEx
wget https://patrick-test-1.s3.amazonaws.com/storage.xml
cd
ll $CMS_PATH/SITECONF/local/JobConfig/site-local-config.xml
