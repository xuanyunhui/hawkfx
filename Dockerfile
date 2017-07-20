FROM jruby:9-onbuild
RUN wget https://chriswhocodes.com/downloads/openjfx-8u60-sdk-overlay-linux-amd64.zip && \
    unzip -d /usr/lib/jvm/java-8-openjdk-amd64 openjfx-8u60-sdk-overlay-linux-amd64.zip && \
    rm -rf openjfx-8u60-sdk-overlay-linux-amd64.zip
    
CMD ["jruby -G -S hawkfx.rb"]
