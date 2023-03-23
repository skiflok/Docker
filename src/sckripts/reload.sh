#!/bin/bash
docker exec vio nginx -s reload
docker exec vio service nginx start