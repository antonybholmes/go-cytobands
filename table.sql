PRAGMA journal_mode = WAL;
PRAGMA foreign_keys = ON;

CREATE TABLE info (
	id INTEGER PRIMARY KEY ASC,
	genome TEXT NOT NULL);

CREATE TABLE cytobands (
	id INTEGER PRIMARY KEY ASC,
	chr TEXT NOT NULL,
	start INTEGER NOT NULL,
	end INTEGER NOT NULL,
	name TEXT NOT NULL,
	giemsa_stain TEXT NOT NULL,
	UNIQUE(chr, start, end, name, giemsa_stain));
CREATE INDEX cytobands_name_idx ON cytobands(name);

 