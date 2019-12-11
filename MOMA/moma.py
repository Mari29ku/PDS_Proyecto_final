#! /usr/bin/env python
# -*- coding: utf-8 -*-

import csv
import psycopg2
import psycopg2.extras

import sys
from datetime import timedelta

import click

import io

from dynaconf import settings

from pathlib import Path

@click.group()
@click.pass_context
def moma(ctx):
    ctx.ensure_object(dict)
    conn = psycopg2.connect(settings.get('PGCONNSTRING'))
    conn.autocommit = True
    ctx.obj['conn'] = conn

    queries = {}
    for sql_file in Path('sql').glob('*.sql'):
        with open(sql_file,'r') as sql:
            sql_key = sql_file.stem
            query = str(sql.read())
            queries[sql_key] = query
    ctx.obj['queries'] = queries

@moma.command()
@click.pass_context
def create_schemas(ctx):
    query = ctx.obj['queries'].get('create_schemas')
    conn=ctx.obj['conn']
    with conn.cursor() as cur:
        cur.execute(query)


@moma.command()
@click.pass_context
def create_raw_tables(ctx):
    query = ctx.obj['queries'].get('create_raw_tables')
    conn=ctx.obj['conn']
    with conn.cursor() as cur:
        cur.execute(query)

@moma.command()
@click.pass_context
def load_moma(ctx):
    conn = ctx.obj['conn']
    print("Veamos la conexion")
    print(conn)
    cur = conn.cursor()
    with open('../data/artist.csv', 'r') as f:
        reader = csv.reader(f)
        next(reader) # Nos saltamos la primer linea (el header).
        for row in reader:
            cur.execute("INSERT INTO raw.artist VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)", row)
    conn.commit()

@moma.command()
@click.pass_context
def to_cleaned():
    query = ctx.obj['queries'].get('to_cleaned')
    conn=ctx.obj['conn']
    with conn.cursor() as cur:
        cur.execute(query)

@moma.command()
@click.pass_context
def to_semantic():
    query = ctx.obj['queries'].get('to_semantic')
    conn=ctx.obj['conn']
    with conn.cursor() as cur:
        cur.execute(query)

@moma.command()
@click.pass_context
def create_features():
    query = ctx.obj['queries'].get('create_features')
    conn=ctx.obj['conn']
    with conn.cursor() as cur:
        cur.execute(query)


if __name__ == '__main__':
    moma()

