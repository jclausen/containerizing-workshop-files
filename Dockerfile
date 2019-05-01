FROM ortussolutions/commandbox

COPY ./ ${APP_DIR}/

RUN cd $APP_DIR/build/setup-env.sh