#!/usr/bin/python
# -*- coding: utf-8 -*-

# ==============================================================================
# Challenge LabsEV
# Created by: Laercio Serra (laercio.serra@gmail.com)
# Etapa 2b: exporting all tables from sqlite3 to parquet files.
# ==============================================================================
import logging
import os
import sqlite3 as db
import sys

import pandas as pd

# Setting the parameters
db_path = '/home/lserra/PycharmProjects/LabsEV/data/'
db_name = 'formula_1.db'
database = os.path.join(db_path, db_name)

parquet_path = '/home/lserra/PycharmProjects/LabsEV/data/parquet/'

log_dir = '/home/lserra/PycharmProjects/LabsEV/logs'
log_file = "LabsEV.log"
log_path = os.path.join(log_dir, log_file)

# Logger initialisation
logger = logging.getLogger('sqlite_to_parquet')

# Create console handler and set level to debug
file_handler = logging.FileHandler("{}".format(log_path))
formatter = logging.Formatter(
    '%(asctime)s - %(name)s - %(pathname)s - %(levelname)s - %(message)s'
)
file_handler.setFormatter(formatter)
logger.addHandler(file_handler)

# Setting the Logger Level (INFO)
logger.setLevel(logging.INFO)


def export_parquet_files():
    """
    Export from sqlite to parquet file
    """
    status = True

    try:
        logger.info("Creating the database connection . . .")
        con = db.connect(database)

        logger.info('Opening a new connection to the database.')
        tables = con.cursor()

        qry_tables = '''
        SELECT name FROM sqlite_master WHERE type = "table" ORDER BY name;
        '''

        # List all tables
        logger.info("Selecting all tables from database . . .")
        tables.execute(qry_tables)

        logger.info("Exporting all data to parquet file . . .")

        # For each table export all data to parquet file
        for table in tables:
            qry_table = '''SELECT * FROM {};'''.format(table[0])
            parquet_file = table[0] + '.parquet.gzip'
            data_path = os.path.join(parquet_path, parquet_file)

            data_table = pd.read_sql_query(qry_table, con=con)

            print(
                ">> TABLE: {} -> Total rows: {}".format(
                    table[0],
                    str(len(data_table))
                )
            )
            print("-" * 100)

            # Creates list of all column headers
            all_columns = list(data_table)

            # Convert all columns to type(str)
            data_table[all_columns] = data_table[all_columns].astype(str)

            # Save all data to parquet file
            data_table.to_parquet(
                data_path,
                engine='pyarrow',
                compression='gzip',
                index=False
            )

        logger.info("Closing the database connection . . .")
        con.close()

    except Exception as e:
        logger.info(e)
        status = False

    return status


if __name__ == '__main__':

    result = export_parquet_files()

    if result:
        logger.info('Process finish successfully!')
        sys.exit(0)
    else:
        logger.info('Something went wrong!')
        sys.exit(1)
