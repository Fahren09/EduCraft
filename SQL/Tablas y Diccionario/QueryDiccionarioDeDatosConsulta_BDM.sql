USE DB_BDM_CURSOS;

SELECT 
    c.TABLE_NAME AS 'Tabla', 
    c.COLUMN_NAME AS 'Nombre Columna', 
    c.DATA_TYPE AS 'TipoDeDato', 
    c.CHARACTER_MAXIMUM_LENGTH AS 'Max Length', 
    CASE 
        WHEN c.IS_NULLABLE = 'NO' THEN 'NO'
        ELSE 'SI'
    END AS 'Permite Nulls', 
    CASE
        WHEN c.EXTRA LIKE '%auto_increment%' THEN 'SI'
        ELSE 'NO'
    END AS 'Es Autoincrement', 
    c.COLUMN_COMMENT AS 'Descripcion', 
    
   
    CASE 
        WHEN kcu.CONSTRAINT_NAME IS NOT NULL AND tc.CONSTRAINT_TYPE = 'PRIMARY KEY' THEN 'PK'
        ELSE NULL
    END AS 'Primary Key',

    
    fk.REFERENCED_TABLE_NAME AS 'ForeignKey Reference Table',
    fk.REFERENCED_COLUMN_NAME AS 'ForeignKey Reference Column'

FROM 
    INFORMATION_SCHEMA.COLUMNS c


LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu 
    ON c.TABLE_SCHEMA = kcu.TABLE_SCHEMA 
    AND c.TABLE_NAME = kcu.TABLE_NAME 
    AND c.COLUMN_NAME = kcu.COLUMN_NAME


LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
    ON kcu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME 
    AND kcu.TABLE_SCHEMA = tc.TABLE_SCHEMA
    AND kcu.TABLE_NAME = tc.TABLE_NAME


LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE fk 
    ON c.TABLE_SCHEMA = fk.TABLE_SCHEMA 
    AND c.TABLE_NAME = fk.TABLE_NAME 
    AND c.COLUMN_NAME = fk.COLUMN_NAME
    AND fk.REFERENCED_TABLE_NAME IS NOT NULL 

WHERE 
    c.TABLE_SCHEMA = 'DB_BDM_CURSOS' 
ORDER BY 
    c.TABLE_NAME, 
    c.ORDINAL_POSITION;
