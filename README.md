RUN app by executing below commands
===================================


Step 1 : clone git repo either of way you feel compfort:::
         $ git clone https://github.com/Sadashiv/simpleapp.git
         cd simpleapp
         git checkout master

Step 2 : cd ::
         Install customized python
         $ ./installpy3.sh -s

         Error: zipimport.ZipImportError: can't decompress data; zlib not available
         RHEL/CentOS: yum install gcc gcc-c++ zlib zlib.i686 zlib-devel zlib-devel.i686 libffi-devel xz-devel \
                      sqlite-devel python-devel openldap-devel openssl-devel bzip2-devel sqlite sqlite-devel openssl-devel.i686

         UBUNTU: apt-get install build-essential gcc libncursesw5-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev libssl-dev \
                 openssl zlib1g-dev libffi-dev libmysqlclient-dev libsasl2-dev python-dev libldap2-dev libbz2-dev
         Once above command execution success
         check python installed in the current working directory
         $ ./usr/bin/python3

Step 3: Pip install all the dependent packages by running below script
        $ ./pipinstall.sh

Step 4 : Sync the modules and migrate::
         $ ./usr/bin/python3 manage.py migrate
         $ ./usr/bin/python3 manage.py makemigrations

Step 5 : Run the server in development mode::
         $ ./usr/bin/python3 manage.py runserver
         Note : Default port is going to be 8000

         Try to access below url in browser
         http://localhost:8000/home

         Run with customized port say 8090
         $ ./usr/bin/python3 manage.py runserver 8090

         If it's not able to access into other machine open for any IP in same network
         $ ./usr/bin/python3 manage.py runserver 0.0.0.0:8090

