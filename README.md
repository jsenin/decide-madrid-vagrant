Vagrant file for https://github.com/AyuntamientoMadrid/consul

This vagrant file build the environment neede to work with this iniciative.

you need to have vagrant, ansible and git in your box
```
sudo apt-get install vagrant ansible git

git clone https://github.com/jsenin/decide-madrid-vagrant 
cd decide-madrid-vagrant
git submodule update --init
vagrant up
```

If provision fails, run again with

```
vagrant provision


Start application

Access to box 
``` 
vagrant ssh

and run rails sever
```
cd /vagrant
bin/rails s -b 0.0.0.0
```

Access to the server at http://localhost:3000 


