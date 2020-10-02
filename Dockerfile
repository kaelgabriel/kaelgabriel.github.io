FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential

# Reduce layers by grouping related commands into single RUN steps
RUN groupadd -r -g 1000 appuser && \
useradd -r -m -u 1000 -g appuser appuser

# Setting workdir will also create the dir if it doesn't exist, so no need to mkdir
WORKDIR /home/appuser/myapp

# Copy everything over in one go
COPY . ./

# This line should fix your issue 
# (give the user ownership of their home dir and make Gemfile.lock writable)
# Must still be root for this to work
RUN chown -R appuser:appuser /home/appuser/ && \
chmod +w /home/appuser/myapp/Gemfile.lock

USER appuser

ENV BUNDLER_VERSION 2.1.4

RUN gem install bundler -v $BUNDLER_VERSION 

RUN bundle install 
# RUN gem update --system \
    # && gem install bundler -v $BUNDLER_VERSION \
    # && bundle install 