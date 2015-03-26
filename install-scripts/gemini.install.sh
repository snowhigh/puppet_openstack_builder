# Supplemental script to set settings specific to the Gemini install
#

# Set this to deb to install puppet modules from packages, or to git
# to install puppet modules using librarian and git
export install_type=deb

apt-get update && apt-get install -y ipmitool

# Fix puppet, clobbering any existing puppet version to ensure
# PKI gets set up correctly.
apt-get remove --purge --yes puppet puppet-common
rm -rf /etc/puppet/puppet.conf /var/lib/puppet

# run dist-upgrade to ensure vendor repo packages which replace
# default repo packages get installed
apt-get dist-upgrade -y
