#!/bin/sh
sed -i '/^host all all all/s/^host /hostssl /' /var/lib/postgresql/data/pg_hba.conf
