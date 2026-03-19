#FROM ubuntu/python:3.12-24.04_stable
FROM ubuntu/nginx:latest
#FROM python:slim
RUN mkdir /root/adsbcot
WORKDIR /root/adsbcot
#COPY . /root/adsbcot
RUN apt update && apt upgrade -y
RUN apt install sudo -y
#RUN sudo apt install pip -y
#RUN sudo python3 -m pip install adsbcot
RUN apt install wget -y
RUN wget https://github.com/snstac/aircot/releases/latest/download/aircot_latest_all.deb
RUN sudo apt install -f ./aircot_latest_all.deb -y
RUN wget https://github.com/snstac/pytak/releases/latest/download/pytak_latest_all.deb
RUN sudo apt install -f ./pytak_latest_all.deb -y
RUN wget https://github.com/snstac/adsbcot/releases/latest/download/adsbcot_latest_all.deb
RUN sudo apt install -f ./adsbcot_latest_all.deb -y
RUN sudo apt install pip -y
RUN rm adsbcot_latest_all.deb
RUN rm pytak_latest_all.deb
RUN rm aircot_latest_all.deb
COPY config.ini /root/adsbcot
COPY adsb.key /root/adsbcot
COPY adsb.pem /root/adsbcot
#RUN cd /root/adsbcot
CMD [ "adsbcot", "-c", "config.ini" ]



