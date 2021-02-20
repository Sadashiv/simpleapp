RUN app by executing below commands
===================================


Step 1 : clone git repo either of way you feel compfort:::
         $ git clone https://github.com/Sadashiv/simpleapp.git
         cd simpleapp
         git checkout master

Step 2 : cd ::
         Install customized python
         $ ./installpy3.sh -s

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
         http://localhost:8000/

         Run with customized port say 8090
         $ ./usr/bin/python3 manage.py runserver 8090

         If it's not able to access into other machine open for any IP in same network
         $ ./usr/bin/python3 manage.py runserver 0.0.0.0:8090


Build Docker image, create and start container
=============================================
docker build -t simpleapp  .
docker container create containerapp -p 8000:8000 simpleapp
docker container create --name containerapp -p 8000:8000 simpleapp
docker exec -it containerapp /bin//bash
http://localhost:8000/

Docker image URL: https://hub.docker.com/repository/docker/9538253250/simpleapp


Login to aws.com
Containers - Elastic Container Service
Create new task definition -> task definition name(simplepptask) -> add container -> container name(simpleappcontainer) -> docker.io/9538253250/simpleapp:latest
map host port(8000) and container port(8000) then click on create - Task creation completed successfully


Clusters->create cluster-> EC2 Linux + Networking click on Next Step
Cluster name(simpleappcluster) -> click on create
Select launch type as EC2 -> click on cluster create -> tasks -> Run new task -> Select task created -> select cluster -> Run Task


Deloper Tools -> Code Pipeline ->
pipeline name(simpleapp_pipeline) click on next
Source provider(code)->GitHub(Verson 2)
Connect to github-> reponame (Sadashiv/simplepp)->branchname(master) click on next
By passing build since we are not building any package like jar, war any package.
Select deploy provider(amazon ecs) -> cluster name(simpleappcluster) -> service name(simplepptask) -> click on next
Create pipeline

