# SELinux
cp /vagrant/rewrites/selinux.conf /etc/selinux/config
setenforce 0

yum install -y zlib-devel ncurses-devel sqlite-devel openssl-devel tk-devel bzip2-devel gdbm-devel readline-devel iptables

# Repos
rpm -ivh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/epel.repo
yum -y --enablerepo=epel install python26 python-simplejson python26-devel python-crypto libffi-devel git
yum -y --enablerepo=epel install python26-PyYAML python26-paramiko python26-jinja2

ln -sf  /usr/bin/python26 /usr/local/bin/python
echo "export PATH=/bin:/usr/local/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin" >> ~/.bashrc
source ~/.bashrc

cd /usr/local/src
wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py
python26 ez_setup.py --insecure
easy_install-2.6 pip

 pip2.6 install jinja2

cd /usr/local/src
git clone git://github.com/ansible/ansible.git
cd ./ansible
git submodule update --init --recursive
source ./hacking/env-setup


# run ansible-playbook
#ansible-playbook -i /vagrant/ansible/host /vagrant/ansible/site.yml -C -D -v
ansible-playbook -i /vagrant/ansible/host /vagrant/ansible/site.yml -D
