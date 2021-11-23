#!/bin/bash
echo "The script has 0 arguments"
yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
yum -y install cvmfs cvmfs-config-default cvmfs-auto-setup
cvmfs_config setup
echo "CVMFS_REPOSITORIES=cms.cern.ch,sft.cern.ch,grid.cern.ch,oasis.opensciencegrid.org" >> /etc/cvmfs/default.local
echo "CVMFS_HTTP_PROXY=DIRECT" >> /etc/cvmfs/default.local
cvmfs_config probe
yum -y install per15
yum -y install perl-Params-Validate
rpm -ql perl-Params-Validate
yum -y install cpan
cpan Module::Build
cpan Test::Harness::Straps
perl ./Build.PL
export SCRAM_ARCH=slc7_amd64_gcc900
source /cvmfs/cms.cern.ch/cmsset_default.sh
