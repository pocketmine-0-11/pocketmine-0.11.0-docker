# PocketMine MP for version v0.11.0 minecraft

To run:

first build the docker image

```
git clone https://github.com/pocketmine-0.11/pocketmine-0.11.0-docker.git
cd pocketmine-0.11.0-docker
docker build .
```
Before running, create/move to a empty folder where you want your worlds and plugins in, and create a `worlds` and `plugins` directory, using exact wording.
```
mkdir PMMP
cd PMMP
mkdir worlds
mkdir plugins
```
Then run the container with the following parameters:
```
docker run -p 19132:19132/udp -v ./worlds:/worlds -v ./plugins:/plugins --tty --interactive <container id>
```
