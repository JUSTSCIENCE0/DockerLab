FROM debian
COPY uya_727.sh .
RUN chmod ugo+x uya_727.sh
CMD ./uya_727.sh
