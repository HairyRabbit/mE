-- PostgreSQL initial

BEGIN;

-- Create current user

CREATE USER yufi SUPERUSER CREATEDB;


-- Create Database

CREATE DATABASE me;


-- Create extension for uuid

CREATE extension IF NOT EXISTS "uuid-ossp";

COMMIT;
