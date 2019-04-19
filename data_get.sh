#!/bin/sh

BUCKET=devopstar
PREFIX=resources/neural-painters


case "$1" in
    "put")
        # make bucket
        aws s3 mb s3://$BUCKET

        # push pre-trained
        aws s3 sync checkpoint/tf_gan3/ \
            s3://$BUCKET/$PREFIX/tf_gan3/
        aws s3 sync checkpoint/tf_vae/ \
            s3://$BUCKET/$PREFIX/tf_vae/
        ;;

    "get")
        # make folders
        mkdir checkpoint

        # get pre-trained
        aws s3 sync s3://$BUCKET/$PREFIX/tf_gan3/ checkpoint/tf_gan3
        aws s3 sync s3://$BUCKET/$PREFIX/tf_vae/ checkpoint/tf_vae
        ;;
esac