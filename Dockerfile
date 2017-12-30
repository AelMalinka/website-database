# Copyright 2017 (c) Michael Thomas (malinka) <malinka@entropy-development.com>
# Distributed under the terms of the GNU Affero General Public License v3

FROM aelmalinka/postgres

COPY run.bash /run.bash
RUN chmod +x run.bash

CMD [ "su", "postgres", "-c", "/run.bash" ]
