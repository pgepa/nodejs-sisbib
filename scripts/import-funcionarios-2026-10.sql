-- =============================================================================
-- Import funcionários → usuarios (idempotent)
-- Source : 2026-10-funcionarios.xlsx
-- Generated at: 2026-11-13 12:39:49 UTC
--
-- Spreadsheet rows        : 709
-- Unique CPF in sheet     : 696
-- Already in database     : 293
-- New users to insert     : 403
-- Duplicate sheet rows    : 13 (same CPF, extra vínculo)
--
-- Defaults for NEW users:
--   phone    = 987654321
--   email    = firstname.lastname@pge.pa.gov.br
--   password = 123456  (bcrypt cost 8; change after first login)
--   role     = user (roleId = 1)
-- Existing users are NOT updated.
-- Safe to re-run on production: guarded by CPF / user_roles checks.
-- =============================================================================

START TRANSACTION;

-- ABNER SERIQUE DO NASCIMENTO | mat=5703581 | cpf=21956014268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5703581', 'ABNER SERIQUE DO NASCIMENTO', 'GRH',
  '21956014268', 'abner.nascimento@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '21956014268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '21956014268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ADRIANA DANIELA MORAES DE LIMA | mat=5969522 | cpf=01367128277
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969522', 'ADRIANA DANIELA MORAES DE LIMA', 'GAB',
  '01367128277', 'adriana.lima@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01367128277');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01367128277'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ADRIANA MOREIRA ROCHA | mat=57175199 | cpf=65665643220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175199', 'ADRIANA MOREIRA ROCHA', 'GRH',
  '65665643220', 'adriana.rocha@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '65665643220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '65665643220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ADRIANA PAULA MARTINS LUCAS VIDONHO | mat=57194478 | cpf=37369865215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57194478', 'ADRIANA PAULA MARTINS LUCAS VIDONHO', 'GRH',
  '37369865215', 'adriana.vidonho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '37369865215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '37369865215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ADRIANE DE NAZARE MENEZES COSTA RAMOS | mat=4223586 | cpf=02898150290
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223586', 'ADRIANE DE NAZARE MENEZES COSTA RAMOS', 'GCONT',
  '02898150290', 'adriane.ramos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02898150290');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02898150290'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ADRIANO DA SILVA SANTOS FILHO | mat=5991144 | cpf=02009449240
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991144', 'ADRIANO DA SILVA SANTOS FILHO', 'PCON',
  '02009449240', 'adriano.filho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02009449240');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02009449240'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ADSON DOURADO BARBOSA | mat=4421 | cpf=04374711287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4421', 'ADSON DOURADO BARBOSA', 'GRH',
  '04374711287', 'adson.barbosa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04374711287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04374711287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- AFONSO DO SOCORRO MARAMALDO DE ANDRADE | mat=80845730 | cpf=18177395220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '80845730', 'AFONSO DO SOCORRO MARAMALDO DE ANDRADE', 'SECPCTA',
  '18177395220', 'afonso.andrade@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '18177395220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '18177395220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALAISE BARBOSA FERREIRA | mat=5987018 | cpf=01428469290
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5987018', 'ALAISE BARBOSA FERREIRA', 'GMAP',
  '01428469290', 'alaise.ferreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01428469290');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01428469290'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALANA CAROLINE DOS SANTOS E SILVA | mat=5999071 | cpf=04628880298
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5999071', 'ALANA CAROLINE DOS SANTOS E SILVA', 'SECPCTA',
  '04628880298', 'alana.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04628880298');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04628880298'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALANA DO VALE TEIXEIRA DA COSTA | mat=5985131 | cpf=01213536219
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5985131', 'ALANA DO VALE TEIXEIRA DA COSTA', 'SECPCTA',
  '01213536219', 'alana.costa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01213536219');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01213536219'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALEFE HENRIQUE DE LACERDA GOMES | mat=5999865 | cpf=00089205243
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5999865', 'ALEFE HENRIQUE DE LACERDA GOMES', 'SECPRPV',
  '00089205243', 'alefe.gomes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00089205243');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00089205243'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALESSANDRA LEAO BRAZAO DOS SANTOS | mat=5902886 | cpf=87237490249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902886', 'ALESSANDRA LEAO BRAZAO DOS SANTOS', 'GRH',
  '87237490249', 'alessandra.santos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '87237490249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '87237490249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALESSANDRA MAGALHAES BEZERRA | mat=57191844 | cpf=33426821249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57191844', 'ALESSANDRA MAGALHAES BEZERRA', 'GRH',
  '33426821249', 'alessandra.bezerra@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '33426821249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '33426821249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALESSANDRO MAIA DUARTE JUNIOR | mat=4222786 | cpf=03594706290
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222786', 'ALESSANDRO MAIA DUARTE JUNIOR', 'P3AR',
  '03594706290', 'alessandro.junior@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03594706290');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03594706290'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALEXANDRA BERNARDES GALDEZ | mat=57188878 | cpf=69707545291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57188878', 'ALEXANDRA BERNARDES GALDEZ', 'SECPCON',
  '69707545291', 'alexandra.galdez@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '69707545291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '69707545291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALEXANDRA MARIA LIMA RODRIGUES | mat=4222787 | cpf=61900065312
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222787', 'ALEXANDRA MARIA LIMA RODRIGUES', 'SECPCON',
  '61900065312', 'alexandra.rodrigues@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '61900065312');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '61900065312'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALEXANDRE FERREIRA AZEVEDO | mat=54193921 | cpf=57472548200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54193921', 'ALEXANDRE FERREIRA AZEVEDO', 'GRH',
  '57472548200', 'alexandre.azevedo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '57472548200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '57472548200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALEXANDRE SILVA OLIVEIRA | mat=5997216 | cpf=04004372283
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5997216', 'ALEXANDRE SILVA OLIVEIRA', 'SECPFAM',
  '04004372283', 'alexandre.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04004372283');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04004372283'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALINA DA COSTA FERREIRA RIBEIRO | mat=5937410 | cpf=94334480225
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5937410', 'ALINA DA COSTA FERREIRA RIBEIRO', 'SECPCTA',
  '94334480225', 'alina.ribeiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '94334480225');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '94334480225'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALINE ALICE DE ALMEIDA RODRIGUES NASCIMENTO | mat=57175098 | cpf=68851898200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175098', 'ALINE ALICE DE ALMEIDA RODRIGUES NASCIMENTO', 'GRH',
  '68851898200', 'aline.nascimento@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '68851898200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '68851898200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALINE CRISTINA BARBOSA RIBEIRO | mat=5992203 | cpf=03600374290
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992203', 'ALINE CRISTINA BARBOSA RIBEIRO', 'SECCOFIN',
  '03600374290', 'aline.ribeiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03600374290');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03600374290'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ALINE MIRANDA LEVY | mat=55590080 | cpf=68021682272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55590080', 'ALINE MIRANDA LEVY', 'GRH',
  '68021682272', 'aline.levy@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '68021682272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '68021682272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- AMANDA DE OLIVEIRA VALENTE | mat=6404421 | cpf=54599245291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '6404421', 'AMANDA DE OLIVEIRA VALENTE', 'ESAP',
  '54599245291', 'amanda.valente@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '54599245291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '54599245291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- AMANDA GOMES RODRIGUES ISHAK | mat=5902899 | cpf=89647858272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902899', 'AMANDA GOMES RODRIGUES ISHAK', 'GRH',
  '89647858272', 'amanda.ishak@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '89647858272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '89647858272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- AMANDA NUNES SOUZA DOS SANTOS | mat=5891705 | cpf=77622219215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5891705', 'AMANDA NUNES SOUZA DOS SANTOS', 'DTI',
  '77622219215', 'amanda.santos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '77622219215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '77622219215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA CARLA BRITO PARACAMPO | mat=5927329 | cpf=99839318268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5927329', 'ANA CARLA BRITO PARACAMPO', 'SECPCTA',
  '99839318268', 'ana.paracampo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '99839318268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '99839318268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA CATARINA BORGES MOKARZEL FURTADO | mat=5940759 | cpf=84806168220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5940759', 'ANA CATARINA BORGES MOKARZEL FURTADO', 'SECPCTA',
  '84806168220', 'ana.furtado@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '84806168220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '84806168220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA CRISTINA COUTINHO MACHADO | mat=5496772 | cpf=23607084220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5496772', 'ANA CRISTINA COUTINHO MACHADO', 'GRH',
  '23607084220', 'ana.machado@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '23607084220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '23607084220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA CRISTINA DE ARRUDA LEAO | mat=57195341 | cpf=85767069204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57195341', 'ANA CRISTINA DE ARRUDA LEAO', 'GRH',
  '85767069204', 'ana.leao@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '85767069204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '85767069204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA KAROLYNA ARAUJO DANTAS | mat=4223590 | cpf=07140317208
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223590', 'ANA KAROLYNA ARAUJO DANTAS', 'SECPCTA',
  '07140317208', 'ana.dantas@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '07140317208');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '07140317208'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA LUCIA SANTOS BREDERODE | mat=5979020 | cpf=69796580420
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979020', 'ANA LUCIA SANTOS BREDERODE', 'SECPFAM',
  '69796580420', 'ana.brederode@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '69796580420');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '69796580420'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA LUIZA NASSER QUEIROZ NUNES DA SILVA | mat=5902706 | cpf=79449484287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902706', 'ANA LUIZA NASSER QUEIROZ NUNES DA SILVA', 'GRH',
  '79449484287', 'ana.lsilva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '79449484287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '79449484287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA PAULA RODRIGUES DE VILHENA | mat=5993515 | cpf=02867287294
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5993515', 'ANA PAULA RODRIGUES DE VILHENA', 'SECPROFISCO',
  '02867287294', 'ana.vilhena@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02867287294');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02867287294'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA PRISCILA CORREA COSTA | mat=5913213 | cpf=00235570281
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5913213', 'ANA PRISCILA CORREA COSTA', 'SECPCTA',
  '00235570281', 'ana.pcosta@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00235570281');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00235570281'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA RITA DOPAZO ANTONIO JOSE LOURENCO | mat=5760429 | cpf=36410390297
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5760429', 'ANA RITA DOPAZO ANTONIO JOSE LOURENCO', 'GRH',
  '36410390297', 'ana.lourenco@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '36410390297');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '36410390297'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANA VITORIA DOS SANTOS VASCONCELOS BOGEA | mat=5939776 | cpf=01869791266
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5939776', 'ANA VITORIA DOS SANTOS VASCONCELOS BOGEA', 'PCON',
  '01869791266', 'ana.bogea@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01869791266');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01869791266'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANALIA OLIVEIRA DE SOUZA | mat=5949679 | cpf=02641191261
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5949679', 'ANALIA OLIVEIRA DE SOUZA', 'P4AR',
  '02641191261', 'analia.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02641191261');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02641191261'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDERSON SANTOS DO NASCIMENTO | mat=4223876 | cpf=09562285260
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223876', 'ANDERSON SANTOS DO NASCIMENTO', 'SECPRPV',
  '09562285260', 'anderson.nascimento@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '09562285260');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '09562285260'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDRE JUNIOR QUEIROZ DE ARAUJO | mat=5998106 | cpf=93555644220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5998106', 'ANDRE JUNIOR QUEIROZ DE ARAUJO', 'SECPCON',
  '93555644220', 'andre.araujo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '93555644220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '93555644220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDRE LUIZ DA CUNHA LIMA | mat=8401656 | cpf=02109877235
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '8401656', 'ANDRE LUIZ DA CUNHA LIMA', 'SECPCTA',
  '02109877235', 'andre.lima@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02109877235');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02109877235'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDRE MATHEUS DE LUCENA MOURA | mat=5933730 | cpf=00903559200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5933730', 'ANDRE MATHEUS DE LUCENA MOURA', 'SECPCON',
  '00903559200', 'andre.moura@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00903559200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00903559200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDRE RICARDO NASCIMENTO TEIXEIRA | mat=5902531 | cpf=81103417215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902531', 'ANDRE RICARDO NASCIMENTO TEIXEIRA', 'GRH',
  '81103417215', 'andre.teixeira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '81103417215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '81103417215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDRE RIVELINO PANATO | mat=5884888 | cpf=66861896268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5884888', 'ANDRE RIVELINO PANATO', 'GRH',
  '66861896268', 'andre.panato@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '66861896268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '66861896268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDRE SILVA DE OLIVEIRA | mat=42811 | cpf=14057174249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '42811', 'ANDRE SILVA DE OLIVEIRA', 'GRH',
  '14057174249', 'andre.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '14057174249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '14057174249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDREA BARBOSA ALVES MACHADO | mat=5996417 | cpf=94913544268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5996417', 'ANDREA BARBOSA ALVES MACHADO', 'DTI',
  '94913544268', 'andrea.machado@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '94913544268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '94913544268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANDREA COSTA PEREIRA FIUZA DE MELLO | mat=57195624 | cpf=33275491253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57195624', 'ANDREA COSTA PEREIRA FIUZA DE MELLO', 'GRH',
  '33275491253', 'andrea.mello@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '33275491253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '33275491253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANNA CAROLINA SASSIM RODRIGUES GOMES | mat=5979073 | cpf=00064534227
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979073', 'ANNA CAROLINA SASSIM RODRIGUES GOMES', 'SECPDA',
  '00064534227', 'anna.gomes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00064534227');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00064534227'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANNA CAROLINA SILVA SANTOS | mat=5979059 | cpf=00869153200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979059', 'ANNA CAROLINA SILVA SANTOS', 'SECPDA',
  '00869153200', 'anna.csantos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00869153200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00869153200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANNA LAURA MANESCHY FADEL | mat=5991166 | cpf=01487021208
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991166', 'ANNA LAURA MANESCHY FADEL', 'PCON',
  '01487021208', 'anna.fadel@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01487021208');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01487021208'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANTONIO CARLOS MONTEIRO CARDOSO | mat=8401420 | cpf=02183940204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '8401420', 'ANTONIO CARLOS MONTEIRO CARDOSO', 'ESAP',
  '02183940204', 'antonio.cardoso@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02183940204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02183940204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ANTONIO VILLAR PANTOJA JUNIOR | mat=57190675 | cpf=18528813215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57190675', 'ANTONIO VILLAR PANTOJA JUNIOR', 'GRH',
  '18528813215', 'antonio.junior@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '18528813215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '18528813215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ARIANE DE JESUS SOUZA | mat=5992326 | cpf=04055456220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992326', 'ARIANE DE JESUS SOUZA', 'SECPRPV',
  '04055456220', 'ariane.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04055456220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04055456220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ARNALDO SILVA DA ROSA | mat=3274861 | cpf=15770141204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '3274861', 'ARNALDO SILVA DA ROSA', 'GRH',
  '15770141204', 'arnaldo.rosa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '15770141204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '15770141204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ARTHUR GUILHERME GUERRA AZALIM | mat=5969529 | cpf=13897310732
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969529', 'ARTHUR GUILHERME GUERRA AZALIM', 'P3AR',
  '13897310732', 'arthur.azalim@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '13897310732');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '13897310732'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ARTHUR IGOR OLIVEIRA MEIRELLES | mat=5933788 | cpf=03901515216
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5933788', 'ARTHUR IGOR OLIVEIRA MEIRELLES', 'SECPFAM',
  '03901515216', 'arthur.meirelles@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03901515216');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03901515216'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ARTHUR SILVEIRA MERENDA | mat=5994459 | cpf=06204417207
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994459', 'ARTHUR SILVEIRA MERENDA', 'SECPCTA',
  '06204417207', 'arthur.merenda@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06204417207');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06204417207'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- AYLA ESTHER COSTA PINTO | mat=5998251 | cpf=04153628220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5998251', 'AYLA ESTHER COSTA PINTO', 'SECPRPV',
  '04153628220', 'ayla.pinto@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04153628220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04153628220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BARBARA SANCHES PUREZA RODRIGUES | mat=4223608 | cpf=03916661264
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223608', 'BARBARA SANCHES PUREZA RODRIGUES', 'SECPCTA',
  '03916661264', 'barbara.rodrigues@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03916661264');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03916661264'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BEATRIZ AGUIAR MOTA | mat=5987011 | cpf=02421546206
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5987011', 'BEATRIZ AGUIAR MOTA', 'SECPCTA',
  '02421546206', 'beatriz.mota@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02421546206');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02421546206'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BEATRIZ LAMARTINE NOGUEIRA ARAUJO | mat=5969516 | cpf=02387299230
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969516', 'BEATRIZ LAMARTINE NOGUEIRA ARAUJO', 'PCTA',
  '02387299230', 'beatriz.araujo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02387299230');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02387299230'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BEATRIZ STEFANNY FERNANDES DE MELO | mat=5990824 | cpf=04843114251
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5990824', 'BEATRIZ STEFANNY FERNANDES DE MELO', 'SECPFAM',
  '04843114251', 'beatriz.melo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04843114251');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04843114251'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BENILSON MAURO DE SOUZA COSTA | mat=5902553 | cpf=40163792291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902553', 'BENILSON MAURO DE SOUZA COSTA', 'GRH',
  '40163792291', 'benilson.costa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '40163792291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '40163792291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BERNARDO ROCHA SALGADO | mat=4223592 | cpf=99932180220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223592', 'BERNARDO ROCHA SALGADO', 'SECPCTA',
  '99932180220', 'bernardo.salgado@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '99932180220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '99932180220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BIANCA COSTA SILVA SERRUYA | mat=5903652 | cpf=77860390230
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5903652', 'BIANCA COSTA SILVA SERRUYA', 'GRH',
  '77860390230', 'bianca.serruya@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '77860390230');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '77860390230'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRENDA CAMILLY MACEDO BARBOSA | mat=5992278 | cpf=53102886272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992278', 'BRENDA CAMILLY MACEDO BARBOSA', 'COFIN',
  '53102886272', 'brenda.barbosa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '53102886272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '53102886272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRENO JOSE ANTONIO GOES CRUZ | mat=5991161 | cpf=83356347268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991161', 'BRENO JOSE ANTONIO GOES CRUZ', 'PCTA',
  '83356347268', 'breno.cruz@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '83356347268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '83356347268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRENO LOBATO CARDOSO | mat=5902701 | cpf=83297154268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902701', 'BRENO LOBATO CARDOSO', 'PCON',
  '83297154268', 'breno.cardoso@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '83297154268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '83297154268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRUNA CORREA DA SILVA | mat=55208788 | cpf=02353379273
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55208788', 'BRUNA CORREA DA SILVA', 'SECPCON',
  '02353379273', 'bruna.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02353379273');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02353379273'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRUNA GEOVANA SANTANA DE BRITO | mat=5989652 | cpf=06080427222
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5989652', 'BRUNA GEOVANA SANTANA DE BRITO', 'SECPRPV',
  '06080427222', 'bruna.brito@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06080427222');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06080427222'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRUNA ISABELLY BARBOSA FRANCO | mat=4223595 | cpf=04473632202
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223595', 'BRUNA ISABELLY BARBOSA FRANCO', 'ESAP',
  '04473632202', 'bruna.franco@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04473632202');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04473632202'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRUNO DOS SANTOS ALMEIDA | mat=4223577 | cpf=08364302205
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223577', 'BRUNO DOS SANTOS ALMEIDA', 'SECPCTA',
  '08364302205', 'bruno.almeida@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '08364302205');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '08364302205'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRUNO MAIA FERREIRA | mat=5934247 | cpf=02051373264
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5934247', 'BRUNO MAIA FERREIRA', 'P1AR',
  '02051373264', 'bruno.ferreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02051373264');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02051373264'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRUNO NEVES MEDINA | mat=5994800 | cpf=04998992295
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994800', 'BRUNO NEVES MEDINA', 'SECPCTA',
  '04998992295', 'bruno.medina@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04998992295');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04998992295'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- BRUNO YOHEIJI KONO RAMOS | mat=57190493 | cpf=63102595200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57190493', 'BRUNO YOHEIJI KONO RAMOS', 'GRH',
  '63102595200', 'bruno.ramos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63102595200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63102595200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CAIO AUGUSTO FREITAS DAS NEVES | mat=5993581 | cpf=03215452227
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5993581', 'CAIO AUGUSTO FREITAS DAS NEVES', 'SECPCTA',
  '03215452227', 'caio.neves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03215452227');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03215452227'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CAIO LINHARES ALVES | mat=4222404 | cpf=03480226205
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222404', 'CAIO LINHARES ALVES', 'DTI',
  '03480226205', 'caio.alves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03480226205');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03480226205'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CAMILA BUSARELLO | mat=55587635 | cpf=02852648938
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55587635', 'CAMILA BUSARELLO', 'GRH',
  '02852648938', 'camila.busarello@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02852648938');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02852648938'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CAMILA FONTELLES DE LIMA LEITE | mat=54183137 | cpf=62692097220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54183137', 'CAMILA FONTELLES DE LIMA LEITE', 'GRH',
  '62692097220', 'camila.leite@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '62692097220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '62692097220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CAMILE DE CASSIA CAVALEIRO CARDOSO | mat=5988416 | cpf=02450219226
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5988416', 'CAMILE DE CASSIA CAVALEIRO CARDOSO', 'SECPCTA',
  '02450219226', 'camile.cardoso@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02450219226');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02450219226'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CARLANDA ALVES DE SOUZA | mat=80845197 | cpf=45029849220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '80845197', 'CARLANDA ALVES DE SOUZA', 'GRH',
  '45029849220', 'carlanda.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '45029849220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '45029849220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CARLO GIORGIO JASSE TOPPINO | mat=54190299 | cpf=46692070244
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54190299', 'CARLO GIORGIO JASSE TOPPINO', 'GRH',
  '46692070244', 'carlo.toppino@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '46692070244');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '46692070244'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CARLOS ALBERTO NUNES SIMOES FILHO | mat=5985415 | cpf=02727022263
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5985415', 'CARLOS ALBERTO NUNES SIMOES FILHO', 'SECPCTA',
  '02727022263', 'carlos.filho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02727022263');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02727022263'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CARLOS AUGUSTO DE SOUZA ESTEVES | mat=55589771 | cpf=63242672291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55589771', 'CARLOS AUGUSTO DE SOUZA ESTEVES', 'GRH',
  '63242672291', 'carlos.esteves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63242672291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63242672291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CARLOS EDUARDO AGUIAR PORTELA RICARTE | mat=8401421 | cpf=04554371220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '8401421', 'CARLOS EDUARDO AGUIAR PORTELA RICARTE', 'SECPCTA',
  '04554371220', 'carlos.ricarte@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04554371220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04554371220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CARLOS LUAN ABREU DO CARMO | mat=5978976 | cpf=04267334285
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5978976', 'CARLOS LUAN ABREU DO CARMO', 'SECPRPV',
  '04267334285', 'carlos.carmo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04267334285');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04267334285'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CARLOS LUCAS MEIRELES DA SILVA | mat=5992129 | cpf=01933089245
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992129', 'CARLOS LUCAS MEIRELES DA SILVA', 'SECPDA',
  '01933089245', 'carlos.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01933089245');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01933089245'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CASTRICIANO DIAS COUTO SAMPAIO | mat=57175153 | cpf=62860119272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175153', 'CASTRICIANO DIAS COUTO SAMPAIO', 'GRH',
  '62860119272', 'castriciano.sampaio@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '62860119272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '62860119272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CAUE FERREIRA MACHADO | mat=5993711 | cpf=03392447200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5993711', 'CAUE FERREIRA MACHADO', 'SECPCTA',
  '03392447200', 'caue.machado@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03392447200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03392447200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CECILIA RIBEIRO GUIMARAES | mat=5951670 | cpf=00702822264
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5951670', 'CECILIA RIBEIRO GUIMARAES', 'GEOF',
  '00702822264', 'cecilia.guimaraes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00702822264');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00702822264'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CELSO ROSIVALDO DE MELO PEREIRA | mat=57175555 | cpf=27145310244
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175555', 'CELSO ROSIVALDO DE MELO PEREIRA', 'GRH',
  '27145310244', 'celso.pereira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '27145310244');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '27145310244'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CESAR AUGUSTO CARNEIRO LOPES JUNIOR | mat=57173764 | cpf=61191493253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57173764', 'CESAR AUGUSTO CARNEIRO LOPES JUNIOR', 'GRH',
  '61191493253', 'cesar.junior@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '61191493253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '61191493253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CHARLES ARAUJO GOMES | mat=4222578 | cpf=37049615234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222578', 'CHARLES ARAUJO GOMES', 'GSERV',
  '37049615234', 'charles.gomes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '37049615234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '37049615234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CLARISSE LOBATO MACIEL | mat=5987111 | cpf=03566830283
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5987111', 'CLARISSE LOBATO MACIEL', 'SECPCTA',
  '03566830283', 'clarisse.maciel@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03566830283');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03566830283'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CLAUDIA DOS REIS SOUZA | mat=4223211 | cpf=02135435244
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223211', 'CLAUDIA DOS REIS SOUZA', 'SECPCON',
  '02135435244', 'claudia.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02135435244');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02135435244'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CLEICE KELLY SALES DA SILVA | mat=5991082 | cpf=70195376269
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991082', 'CLEICE KELLY SALES DA SILVA', 'SECPCTA',
  '70195376269', 'cleice.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '70195376269');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '70195376269'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CLISSIA DE FATIMA CHAVES | mat=5985402 | cpf=01920237216
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5985402', 'CLISSIA DE FATIMA CHAVES', 'SECPDA',
  '01920237216', 'clissia.chaves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01920237216');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01920237216'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CRISLANE DA SILVA DELFINO | mat=4223319 | cpf=08840729321
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223319', 'CRISLANE DA SILVA DELFINO', 'SECPCON',
  '08840729321', 'crislane.delfino@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '08840729321');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '08840729321'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- CRISTINA VALERIA MOREIRA CARDOSO | mat=57173468 | cpf=57405379249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57173468', 'CRISTINA VALERIA MOREIRA CARDOSO', 'GRH',
  '57405379249', 'cristina.cardoso@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '57405379249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '57405379249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DALTON EMMANUEL LEAL RODRIGUES | mat=54189959 | cpf=50822462249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54189959', 'DALTON EMMANUEL LEAL RODRIGUES', 'GRH',
  '50822462249', 'dalton.rodrigues@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '50822462249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '50822462249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DANIELA RIBEIRO MOREIRA DEMETRIO DOS SANTO | mat=5902568 | cpf=64899985215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902568', 'DANIELA RIBEIRO MOREIRA DEMETRIO DOS SANTO', 'PCON',
  '64899985215', 'daniela.santo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '64899985215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '64899985215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DANIELLE CANTAO DUARTE | mat=5993958 | cpf=01885605218
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5993958', 'DANIELLE CANTAO DUARTE', 'SECPCTA',
  '01885605218', 'danielle.duarte@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01885605218');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01885605218'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DARLENE CUNHA CARNEIRO DOS SANTOS BARROS | mat=5970430 | cpf=42563135249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5970430', 'DARLENE CUNHA CARNEIRO DOS SANTOS BARROS', 'SECPDA',
  '42563135249', 'darlene.barros@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '42563135249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '42563135249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DEBORAH LANTER LAMARAO | mat=55586650 | cpf=63572290244
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55586650', 'DEBORAH LANTER LAMARAO', 'GRH',
  '63572290244', 'deborah.lamarao@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63572290244');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63572290244'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DEIVISON CAVALCANTE PEREIRA | mat=54193923 | cpf=63724073291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54193923', 'DEIVISON CAVALCANTE PEREIRA', 'GRH',
  '63724073291', 'deivison.pereira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63724073291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63724073291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DENISE DA COSTA SANTOS | mat=80845367 | cpf=70249300206
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '80845367', 'DENISE DA COSTA SANTOS', 'GRH',
  '70249300206', 'denise.santos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '70249300206');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '70249300206'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DENNIS ALEXANDRE WANDERLEY COELHO VIANNA | mat=57176233 | cpf=28697480272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57176233', 'DENNIS ALEXANDRE WANDERLEY COELHO VIANNA', 'GRH',
  '28697480272', 'dennis.vianna@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '28697480272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '28697480272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DENZEL IZIDIO LIMA PEREIRA | mat=5987112 | cpf=06016757209
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5987112', 'DENZEL IZIDIO LIMA PEREIRA', 'SECPCTA',
  '06016757209', 'denzel.pereira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06016757209');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06016757209'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DIANA CASTELO MONCAO DE SOUZA | mat=7001229 | cpf=51736837249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '7001229', 'DIANA CASTELO MONCAO DE SOUZA', 'GRH',
  '51736837249', 'diana.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '51736837249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '51736837249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DIEGO MARTINS MENEZES | mat=4221349 | cpf=88799824272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4221349', 'DIEGO MARTINS MENEZES', 'DAF',
  '88799824272', 'diego.menezes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '88799824272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '88799824272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- DOUGLAS SOUZA DAS MERCES | mat=5980396 | cpf=03719213250
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5980396', 'DOUGLAS SOUZA DAS MERCES', 'ESAP',
  '03719213250', 'douglas.merces@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03719213250');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03719213250'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EDER MARQUES PAIVA | mat=5976393 | cpf=01617244260
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5976393', 'EDER MARQUES PAIVA', 'GRH',
  '01617244260', 'eder.paiva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01617244260');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01617244260'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EDSON HIROSHI MINATO | mat=57224112 | cpf=75791773234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57224112', 'EDSON HIROSHI MINATO', 'GRH',
  '75791773234', 'edson.minato@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '75791773234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '75791773234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EDSON LUCAS DA SILVA DIAS | mat=5921164 | cpf=78797586234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5921164', 'EDSON LUCAS DA SILVA DIAS', 'DTI',
  '78797586234', 'edson.dias@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '78797586234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '78797586234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EDUARDO BEZERRA PORTILHO MAGALHAES | mat=5995600 | cpf=02734212200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5995600', 'EDUARDO BEZERRA PORTILHO MAGALHAES', 'SECPCTA',
  '02734212200', 'eduardo.magalhaes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02734212200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02734212200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EDY CELIA PANTOJA BOGEA | mat=3155722 | cpf=17171202291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '3155722', 'EDY CELIA PANTOJA BOGEA', 'GRH',
  '17171202291', 'edy.bogea@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '17171202291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '17171202291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ELEN MESQUITA DE MOURA DO NASCIMENTO | mat=5903000 | cpf=92303307287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5903000', 'ELEN MESQUITA DE MOURA DO NASCIMENTO', 'GRH',
  '92303307287', 'elen.nascimento@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '92303307287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '92303307287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ELIAS ANTONIO DE ALBUQUERQUE CHAMMA | mat=5135273 | cpf=17345871215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5135273', 'ELIAS ANTONIO DE ALBUQUERQUE CHAMMA', 'GRH',
  '17345871215', 'elias.chamma@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '17345871215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '17345871215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ELIAS VIANA DE CARVALHO | mat=5992086 | cpf=01214739296
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992086', 'ELIAS VIANA DE CARVALHO', 'SECPCTA',
  '01214739296', 'elias.carvalho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01214739296');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01214739296'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ELLEN PATRICIA ALFAIA LOBATO DA LUZ | mat=5994537 | cpf=01896678262
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994537', 'ELLEN PATRICIA ALFAIA LOBATO DA LUZ', 'SECPRPV',
  '01896678262', 'ellen.luz@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01896678262');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01896678262'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ELTON DA COSTA FERREIRA | mat=57202521 | cpf=91013917200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57202521', 'ELTON DA COSTA FERREIRA', 'GRH',
  '91013917200', 'elton.ferreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '91013917200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '91013917200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ELUIZE GABRIELE DOS SANTOS ONCA | mat=5980907 | cpf=90117220272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5980907', 'ELUIZE GABRIELE DOS SANTOS ONCA', 'GRH',
  '90117220272', 'eluize.onca@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '90117220272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '90117220272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EMANUELLE OLIVEIRA NUNES DA SILVA | mat=5977242 | cpf=04964672204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5977242', 'EMANUELLE OLIVEIRA NUNES DA SILVA', 'GRH',
  '04964672204', 'emanuelle.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04964672204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04964672204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EMERSON SILVA SALES | mat=4223951 | cpf=03869893206
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223951', 'EMERSON SILVA SALES', 'P3AR',
  '03869893206', 'emerson.sales@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03869893206');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03869893206'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ENZO JOSE SAMPAIO LISBOA | mat=4222520 | cpf=05174746207
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222520', 'ENZO JOSE SAMPAIO LISBOA', 'SECPCTA',
  '05174746207', 'enzo.lisboa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05174746207');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05174746207'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ERICA ANDRADE RODRIGUES E SILVA | mat=5992084 | cpf=05970928500
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992084', 'ERICA ANDRADE RODRIGUES E SILVA', 'SECPCTA',
  '05970928500', 'erica.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05970928500');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05970928500'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ERICA BARROSO DA SILVA | mat=5992244 | cpf=05558167297
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992244', 'ERICA BARROSO DA SILVA', 'ESAP',
  '05558167297', 'erica.bsilva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05558167297');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05558167297'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ERICK GEORGE FERREIRA DE LIMA | mat=5969118 | cpf=88821773272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969118', 'ERICK GEORGE FERREIRA DE LIMA', 'SECPCON',
  '88821773272', 'erick.lima@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '88821773272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '88821773272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ERICO EUGENIO VIEIRA MACEDO | mat=5975023 | cpf=63728966215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5975023', 'ERICO EUGENIO VIEIRA MACEDO', 'SECPCTA',
  '63728966215', 'erico.macedo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63728966215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63728966215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ERIVANDA BARBOSA DE OLIVEIRA SILVA | mat=54187945 | cpf=37181254391
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54187945', 'ERIVANDA BARBOSA DE OLIVEIRA SILVA', 'GRH',
  '37181254391', 'erivanda.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '37181254391');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '37181254391'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EVA ELIANA DE SOUZA ROCHA | mat=43249 | cpf=05635160204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '43249', 'EVA ELIANA DE SOUZA ROCHA', 'GRH',
  '05635160204', 'eva.rocha@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05635160204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05635160204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EVANDRO FERNANDES CORDEIRO JUNIOR | mat=5927548 | cpf=03650697289
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5927548', 'EVANDRO FERNANDES CORDEIRO JUNIOR', 'SECPCON',
  '03650697289', 'evandro.junior@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03650697289');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03650697289'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- EZIULA DE FATIMA SILVA COSTA | mat=3115 | cpf=06199585291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '3115', 'EZIULA DE FATIMA SILVA COSTA', 'GRH',
  '06199585291', 'eziula.costa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06199585291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06199585291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FABIANA OLIVEIRA DA SILVA | mat=5999111 | cpf=02355022275
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5999111', 'FABIANA OLIVEIRA DA SILVA', 'SECPCTA',
  '02355022275', 'fabiana.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02355022275');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02355022275'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FABIO BRAGA CAVALCANTE | mat=57176191 | cpf=63729903268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57176191', 'FABIO BRAGA CAVALCANTE', 'DTI',
  '63729903268', 'fabio.cavalcante@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63729903268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63729903268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FABIO DE OLIVEIRA MOURA | mat=57176313 | cpf=68973411268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57176313', 'FABIO DE OLIVEIRA MOURA', 'GRH',
  '68973411268', 'fabio.moura@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '68973411268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '68973411268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FABIO NOBRE BRAZ | mat=57194148 | cpf=46707476220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57194148', 'FABIO NOBRE BRAZ', 'GRH',
  '46707476220', 'fabio.braz@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '46707476220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '46707476220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FABIOLA CLAUDIA DA SILVA BEMERGUY | mat=55586358 | cpf=63581574268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55586358', 'FABIOLA CLAUDIA DA SILVA BEMERGUY', 'GRH',
  '63581574268', 'fabiola.bemerguy@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63581574268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63581574268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FABRICIO LEAO NOGUEIRA | mat=5971180 | cpf=74712390263
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5971180', 'FABRICIO LEAO NOGUEIRA', 'DTI',
  '74712390263', 'fabricio.nogueira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '74712390263');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '74712390263'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FABRICIO VASCONCELOS DE OLIVEIRA | mat=55588100 | cpf=46103694272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55588100', 'FABRICIO VASCONCELOS DE OLIVEIRA', 'GRH',
  '46103694272', 'fabricio.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '46103694272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '46103694272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FAEK DOMINGOS MAIA KHOURY | mat=6405820 | cpf=02765372209
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '6405820', 'FAEK DOMINGOS MAIA KHOURY', 'SECPFAM',
  '02765372209', 'faek.khoury@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02765372209');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02765372209'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FAGNER HENRIQUE MAIA FEITOSA | mat=57190715 | cpf=67036538287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57190715', 'FAGNER HENRIQUE MAIA FEITOSA', 'GRH',
  '67036538287', 'fagner.feitosa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '67036538287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '67036538287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FELIPE LISBOA BRASIL | mat=5994215 | cpf=06807733208
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994215', 'FELIPE LISBOA BRASIL', 'SECPDA',
  '06807733208', 'felipe.brasil@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06807733208');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06807733208'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FELIPE PEREIRA COSTA | mat=4222794 | cpf=01883373263
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222794', 'FELIPE PEREIRA COSTA', 'SECPCTA',
  '01883373263', 'felipe.costa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01883373263');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01883373263'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FLAVIA FONTEL MOUSINHO RISUENHO | mat=5979623 | cpf=01540284280
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979623', 'FLAVIA FONTEL MOUSINHO RISUENHO', 'SECPCTA',
  '01540284280', 'flavia.risuenho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01540284280');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01540284280'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FLAVIA MOREIRA ROCHA | mat=54189960 | cpf=58700889253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54189960', 'FLAVIA MOREIRA ROCHA', 'GRH',
  '58700889253', 'flavia.rocha@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '58700889253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '58700889253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FLAVIO RICARDO ALBUQUERQUE AZEVEDO | mat=57175032 | cpf=72781122220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175032', 'FLAVIO RICARDO ALBUQUERQUE AZEVEDO', 'GRH',
  '72781122220', 'flavio.azevedo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '72781122220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '72781122220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FRANCISCO HYGOR DE OLIVEIRA BARROS | mat=5993372 | cpf=01848318227
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5993372', 'FRANCISCO HYGOR DE OLIVEIRA BARROS', 'ESAP',
  '01848318227', 'francisco.barros@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01848318227');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01848318227'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FRANCISCO RAYLAN VALE ALMEIDA | mat=5991150 | cpf=04058109386
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991150', 'FRANCISCO RAYLAN VALE ALMEIDA', 'GRH',
  '04058109386', 'francisco.almeida@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04058109386');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04058109386'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- FRANKLIN DAYWYSON JAQUES DO MONT SERRAT A | mat=5991154 | cpf=91032997249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991154', 'FRANKLIN DAYWYSON JAQUES DO MONT SERRAT A', 'PCTA',
  '91032997249', 'franklin.a@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '91032997249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '91032997249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GABRIEL LOUREIRO DA SILVA | mat=5954122 | cpf=03746056292
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5954122', 'GABRIEL LOUREIRO DA SILVA', 'SECPRPV',
  '03746056292', 'gabriel.lsilva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03746056292');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03746056292'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GABRIEL VICTOR FREITAS FELIX | mat=5960592 | cpf=00824659244
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5960592', 'GABRIEL VICTOR FREITAS FELIX', 'SECPCTA',
  '00824659244', 'gabriel.felix@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00824659244');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00824659244'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GABRIELA FERREIRA RIBEIRO | mat=5977191 | cpf=02442911280
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5977191', 'GABRIELA FERREIRA RIBEIRO', 'SECPCON',
  '02442911280', 'gabriela.ribeiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02442911280');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02442911280'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GABRIELA NUNES RODRIGUES DE CARVALHO | mat=5901665 | cpf=00585396205
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5901665', 'GABRIELA NUNES RODRIGUES DE CARVALHO', 'ESAP',
  '00585396205', 'gabriela.carvalho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00585396205');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00585396205'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GABRIELLA GUIMARAES PESSOA | mat=6406058 | cpf=01799090299
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '6406058', 'GABRIELLA GUIMARAES PESSOA', 'SECPDA',
  '01799090299', 'gabriella.pessoa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01799090299');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01799090299'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GABRYELLY DOS SANTOS BRAGA | mat=5985177 | cpf=03681956278
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5985177', 'GABRYELLY DOS SANTOS BRAGA', 'ESAP',
  '03681956278', 'gabryelly.braga@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03681956278');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03681956278'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GEORGE ALEXANDRO FERREIRA BARBOSA | mat=5963611 | cpf=96763612249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5963611', 'GEORGE ALEXANDRO FERREIRA BARBOSA', 'DTI',
  '96763612249', 'george.barbosa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '96763612249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '96763612249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GERMANA BEZERRA DE AMORIM | mat=54188843 | cpf=57864438253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54188843', 'GERMANA BEZERRA DE AMORIM', 'GRH',
  '57864438253', 'germana.amorim@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '57864438253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '57864438253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GHESSIKA AMANDA MIRANDA MACIEL | mat=5912460 | cpf=96097566204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5912460', 'GHESSIKA AMANDA MIRANDA MACIEL', 'SECPCON',
  '96097566204', 'ghessika.maciel@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '96097566204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '96097566204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GILSELENA DE ALBUQUERQUE ELLERY FROTA | mat=57175217 | cpf=03624756443
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175217', 'GILSELENA DE ALBUQUERQUE ELLERY FROTA', 'GRH',
  '03624756443', 'gilselena.frota@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03624756443');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03624756443'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GILSON ROCHA PIRES | mat=5606519 | cpf=45566453287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5606519', 'GILSON ROCHA PIRES', 'GRH',
  '45566453287', 'gilson.pires@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '45566453287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '45566453287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GIOVANNA DE CARVALHO MANGINI DE ALMEIDA | mat=5528217 | cpf=02199075281
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5528217', 'GIOVANNA DE CARVALHO MANGINI DE ALMEIDA', 'SECPCTA',
  '02199075281', 'giovanna.almeida@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02199075281');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02199075281'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GISELLE ALVES GUERRA | mat=57196992 | cpf=92503543200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57196992', 'GISELLE ALVES GUERRA', 'GLIC',
  '92503543200', 'giselle.guerra@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '92503543200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '92503543200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GIULIANA DOS SANTOS PINHEIRO | mat=5949275 | cpf=01886742251
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5949275', 'GIULIANA DOS SANTOS PINHEIRO', 'SECPDA',
  '01886742251', 'giuliana.pinheiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01886742251');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01886742251'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GLORIA BEATRIZ SARAIVA DE ALBUQUERQUE | mat=5945638 | cpf=80850642272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5945638', 'GLORIA BEATRIZ SARAIVA DE ALBUQUERQUE', 'SECPFAM',
  '80850642272', 'gloria.albuquerque@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '80850642272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '80850642272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GUILHERME GONCALVES ALVES | mat=57176282 | cpf=51711990272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57176282', 'GUILHERME GONCALVES ALVES', 'GRH',
  '51711990272', 'guilherme.alves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '51711990272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '51711990272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GUILHERME MACIEL DOS SANTOS | mat=5993582 | cpf=01425430201
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5993582', 'GUILHERME MACIEL DOS SANTOS', 'DTI',
  '01425430201', 'guilherme.santos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01425430201');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01425430201'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- GUSTAVO SOUSA PANTOJA DA ROCHA | mat=6405620 | cpf=03941137212
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '6405620', 'GUSTAVO SOUSA PANTOJA DA ROCHA', 'SECPCTA',
  '03941137212', 'gustavo.rocha@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03941137212');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03941137212'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HANNA AZEVEDO CARVALHO DA SILVA | mat=5969112 | cpf=01269358235
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969112', 'HANNA AZEVEDO CARVALHO DA SILVA', 'SECPCTA',
  '01269358235', 'hanna.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01269358235');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01269358235'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HELENA DA CONCEICAO BASTOS GOMES DE CARV | mat=54180122 | cpf=41076338291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54180122', 'HELENA DA CONCEICAO BASTOS GOMES DE CARV', 'GRH',
  '41076338291', 'helena.carv@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '41076338291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '41076338291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HELENO MASCARENHAS D OLIVEIRA | mat=57197471 | cpf=60564032204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57197471', 'HELENO MASCARENHAS D OLIVEIRA', 'GRH',
  '60564032204', 'heleno.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '60564032204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '60564032204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HELOINA AGRIA DA LUZ RAMOS | mat=57176519 | cpf=65532350230
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57176519', 'HELOINA AGRIA DA LUZ RAMOS', 'GRH',
  '65532350230', 'heloina.ramos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '65532350230');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '65532350230'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HELOISA SANTIAGO DOS REIS CARNEIRO | mat=4222995 | cpf=07105513209
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222995', 'HELOISA SANTIAGO DOS REIS CARNEIRO', 'SECPCTA',
  '07105513209', 'heloisa.carneiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '07105513209');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '07105513209'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HENRIQUE CEZAR SANTOS LOBATO | mat=80845665 | cpf=44034067268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '80845665', 'HENRIQUE CEZAR SANTOS LOBATO', 'GRH',
  '44034067268', 'henrique.lobato@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '44034067268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '44034067268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HERALDO BERTHOLLET DE AGUIAR GRANA | mat=5525 | cpf=03649598272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5525', 'HERALDO BERTHOLLET DE AGUIAR GRANA', 'GRH',
  '03649598272', 'heraldo.grana@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03649598272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03649598272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HUGO ALVARES PIRES | mat=5992131 | cpf=01663859213
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992131', 'HUGO ALVARES PIRES', 'SECPCTA',
  '01663859213', 'hugo.pires@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01663859213');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01663859213'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- HUMBERTO JUNIOR LIMA LOPES | mat=5992233 | cpf=04815060207
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992233', 'HUMBERTO JUNIOR LIMA LOPES', 'SECPRPV',
  '04815060207', 'humberto.lopes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04815060207');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04815060207'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- IAN MATEUS BRITO PEREIRA | mat=5996410 | cpf=98273426220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5996410', 'IAN MATEUS BRITO PEREIRA', 'SECPRPV',
  '98273426220', 'ian.pereira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '98273426220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '98273426220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ILYUSHIN PINA DA GRACA | mat=5952716 | cpf=03551163243
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5952716', 'ILYUSHIN PINA DA GRACA', 'SECPCTA',
  '03551163243', 'ilyushin.graca@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03551163243');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03551163243'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ISADORA FERREIRA DE SOUZA | mat=5996253 | cpf=02069391248
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5996253', 'ISADORA FERREIRA DE SOUZA', 'SECPCTA',
  '02069391248', 'isadora.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02069391248');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02069391248'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ITALO LUCIANO GONZALEZ SIQUEIRA | mat=5992225 | cpf=02210308240
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992225', 'ITALO LUCIANO GONZALEZ SIQUEIRA', 'SECPROFISCO',
  '02210308240', 'italo.siqueira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02210308240');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02210308240'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ITAMAR FILHO TITO FERNANDES | mat=5969521 | cpf=93846916234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969521', 'ITAMAR FILHO TITO FERNANDES', 'PCTA',
  '93846916234', 'itamar.fernandes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '93846916234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '93846916234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- IVANA PASSOS DE MELO ANTUNES COSTA | mat=5902555 | cpf=87815451349
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902555', 'IVANA PASSOS DE MELO ANTUNES COSTA', 'PCON',
  '87815451349', 'ivana.costa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '87815451349');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '87815451349'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- IZADORA FERNANDES VIANA SANTOS | mat=5992226 | cpf=01302153250
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992226', 'IZADORA FERNANDES VIANA SANTOS', 'P4AR',
  '01302153250', 'izadora.santos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01302153250');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01302153250'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JACYARA MOREIRA RODRIGUES DOS REIS | mat=57194653 | cpf=63408252220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57194653', 'JACYARA MOREIRA RODRIGUES DOS REIS', 'GRH',
  '63408252220', 'jacyara.reis@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63408252220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63408252220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JAIME FERNANDES DE MATTOS JUNIOR | mat=5991171 | cpf=00636683273
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991171', 'JAIME FERNANDES DE MATTOS JUNIOR', 'PDA',
  '00636683273', 'jaime.junior@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00636683273');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00636683273'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JAMILY ROCHA QUEIROZ | mat=5983227 | cpf=06084071279
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5983227', 'JAMILY ROCHA QUEIROZ', 'SECPDA',
  '06084071279', 'jamily.queiroz@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06084071279');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06084071279'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JAYMERSON CARLOS PEREIRA MARQUES | mat=57218644 | cpf=02078549398
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57218644', 'JAYMERSON CARLOS PEREIRA MARQUES', 'GRH',
  '02078549398', 'jaymerson.marques@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02078549398');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02078549398'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JENNIFER ADRIELLY TRINDADE LOBATO VIEIRA | mat=5983738 | cpf=02559937220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5983738', 'JENNIFER ADRIELLY TRINDADE LOBATO VIEIRA', 'SECPCTA',
  '02559937220', 'jennifer.vieira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02559937220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02559937220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JESUINA CARVALHO WATANABE | mat=57196023 | cpf=39889882272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57196023', 'JESUINA CARVALHO WATANABE', 'GRH',
  '39889882272', 'jesuina.watanabe@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '39889882272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '39889882272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JILCENATALIA SILVA PEDROSO | mat=5990806 | cpf=88824314287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5990806', 'JILCENATALIA SILVA PEDROSO', 'SECPRPV',
  '88824314287', 'jilcenatalia.pedroso@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '88824314287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '88824314287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOAO DE AQUINO PINTO NETO | mat=55590088 | cpf=64135756204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55590088', 'JOAO DE AQUINO PINTO NETO', 'PCTA',
  '64135756204', 'joao.aneto@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '64135756204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '64135756204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOAO MARCOS CASTELO DE SOUZA BACELAR | mat=5992209 | cpf=03051878219
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992209', 'JOAO MARCOS CASTELO DE SOUZA BACELAR', 'ESAP',
  '03051878219', 'joao.bacelar@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03051878219');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03051878219'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOAO PEDRO FERREIRA CARNEIRO | mat=5950483 | cpf=04220825207
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5950483', 'JOAO PEDRO FERREIRA CARNEIRO', 'SECPCTA',
  '04220825207', 'joao.carneiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04220825207');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04220825207'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOAO VICTOR EVANGELISTA DA SILVA | mat=4222495 | cpf=02797512227
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222495', 'JOAO VICTOR EVANGELISTA DA SILVA', 'SECPCTA',
  '02797512227', 'joao.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02797512227');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02797512227'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOAO VITTOR LUCENA SOEIRO DOS SANTOS | mat=5969117 | cpf=00826591256
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969117', 'JOAO VITTOR LUCENA SOEIRO DOS SANTOS', 'SECPCON',
  '00826591256', 'joao.santos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00826591256');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00826591256'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOAO WECLEFF SARGES | mat=4221654 | cpf=58639098204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4221654', 'JOAO WECLEFF SARGES', 'P3AR',
  '58639098204', 'joao.sarges@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '58639098204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '58639098204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOSE CLEBER NASCIMENTO DOS SANTOS | mat=5596203 | cpf=26742543272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5596203', 'JOSE CLEBER NASCIMENTO DOS SANTOS', 'GRH',
  '26742543272', 'jose.csantos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '26742543272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '26742543272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOSE DA SILVA NAVA JUNIOR | mat=8014582 | cpf=14765233200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '8014582', 'JOSE DA SILVA NAVA JUNIOR', 'GRH',
  '14765233200', 'jose.sjunior@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '14765233200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '14765233200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOSE GORAYEB SANTOS | mat=868 | cpf=05533511253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '868', 'JOSE GORAYEB SANTOS', 'GRH',
  '05533511253', 'jose.gsantos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05533511253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05533511253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOSE MATEUS PELLIZZARO SOUZA | mat=55208211 | cpf=02617979210
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55208211', 'JOSE MATEUS PELLIZZARO SOUZA', 'P3AR',
  '02617979210', 'jose.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02617979210');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02617979210'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JOSUE PARAENSE FRANCO | mat=5976386 | cpf=98150600230
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5976386', 'JOSUE PARAENSE FRANCO', 'DTI',
  '98150600230', 'josue.franco@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '98150600230');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '98150600230'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JULIANE SILVA SOUZA | mat=5964554 | cpf=02164223292
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5964554', 'JULIANE SILVA SOUZA', 'SECPRPV',
  '02164223292', 'juliane.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02164223292');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02164223292'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- JULIANY CORDEIRO DO NASCIMENTO | mat=5983809 | cpf=11320409903
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5983809', 'JULIANY CORDEIRO DO NASCIMENTO', 'SECPCON',
  '11320409903', 'juliany.nascimento@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '11320409903');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '11320409903'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KAMILLY ALVES GIRARD | mat=5984910 | cpf=03311563263
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5984910', 'KAMILLY ALVES GIRARD', 'SECPDA',
  '03311563263', 'kamilly.girard@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03311563263');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03311563263'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KAMILY VITORIA CORREA DE ALMEIDA | mat=4223729 | cpf=10569934214
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223729', 'KAMILY VITORIA CORREA DE ALMEIDA', 'ESAP',
  '10569934214', 'kamily.almeida@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '10569934214');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '10569934214'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KARINA DE OLIVEIRA SILVA | mat=54189737 | cpf=90644476249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54189737', 'KARINA DE OLIVEIRA SILVA', 'SECPCON',
  '90644476249', 'karina.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '90644476249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '90644476249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KARINA FONSECA KALIL PANTOJA | mat=5887305 | cpf=65718720215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5887305', 'KARINA FONSECA KALIL PANTOJA', 'GRH',
  '65718720215', 'karina.pantoja@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '65718720215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '65718720215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KARINA VASCONCELOS RODRIGUES NOVELINO | mat=57196178 | cpf=44868987291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57196178', 'KARINA VASCONCELOS RODRIGUES NOVELINO', 'GRH',
  '44868987291', 'karina.novelino@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '44868987291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '44868987291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KARINE WILLIANE SOEIRO DE MACEDO | mat=5992346 | cpf=06174740285
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992346', 'KARINE WILLIANE SOEIRO DE MACEDO', 'GAB',
  '06174740285', 'karine.macedo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06174740285');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06174740285'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KARLA ASSEF SANTIAGO | mat=5933649 | cpf=93593759268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5933649', 'KARLA ASSEF SANTIAGO', 'GRH',
  '93593759268', 'karla.santiago@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '93593759268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '93593759268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KARLA FABIOLA MENDONCA REIS | mat=8005722 | cpf=56158459291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '8005722', 'KARLA FABIOLA MENDONCA REIS', 'SECPCTA',
  '56158459291', 'karla.reis@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '56158459291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '56158459291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KAUE DAMASCENO LOPES | mat=4223333 | cpf=04219712232
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223333', 'KAUE DAMASCENO LOPES', 'SECPCTA',
  '04219712232', 'kaue.lopes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04219712232');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04219712232'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KAYLANE MENDONCA MENDONCA | mat=4222783 | cpf=04149186227
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222783', 'KAYLANE MENDONCA MENDONCA', 'ESAP',
  '04149186227', 'kaylane.mendonca@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04149186227');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04149186227'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KELLY CRISTINA NUNES WANZELER | mat=5902799 | cpf=77705602253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902799', 'KELLY CRISTINA NUNES WANZELER', 'GRH',
  '77705602253', 'kelly.wanzeler@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '77705602253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '77705602253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- KLEBSON TINOCO ARAUJO | mat=5614821 | cpf=50814168272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5614821', 'KLEBSON TINOCO ARAUJO', 'GRH',
  '50814168272', 'klebson.araujo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '50814168272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '50814168272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LARA FERNANDA FRANCA DA SILVA | mat=5985842 | cpf=04566535207
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5985842', 'LARA FERNANDA FRANCA DA SILVA', 'P4AR',
  '04566535207', 'lara.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04566535207');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04566535207'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LARA GIULIA COUTINHO SILVA | mat=8401404 | cpf=01927065275
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '8401404', 'LARA GIULIA COUTINHO SILVA', 'P3AR',
  '01927065275', 'lara.gsilva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01927065275');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01927065275'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LARISSA AMANDA DE OLIVEIRA BORGES | mat=4222781 | cpf=06214039205
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222781', 'LARISSA AMANDA DE OLIVEIRA BORGES', 'SECPCTA',
  '06214039205', 'larissa.borges@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06214039205');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06214039205'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LEANDRO NASCIMENTO RODRIGUES | mat=57189810 | cpf=70330905287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57189810', 'LEANDRO NASCIMENTO RODRIGUES', 'PCTA',
  '70330905287', 'leandro.rodrigues@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '70330905287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '70330905287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LEILA MOITINHO BENTES | mat=5937319 | cpf=73505897272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5937319', 'LEILA MOITINHO BENTES', 'SECPCTA',
  '73505897272', 'leila.bentes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '73505897272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '73505897272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LEILA SUELY LONDRES DE OLIVEIRA | mat=55589259 | cpf=57702519215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55589259', 'LEILA SUELY LONDRES DE OLIVEIRA', 'GRH',
  '57702519215', 'leila.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '57702519215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '57702519215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LEONARDO ANDREY COSTA LOPES | mat=5986805 | cpf=01707717257
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5986805', 'LEONARDO ANDREY COSTA LOPES', 'SECPCTA',
  '01707717257', 'leonardo.lopes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01707717257');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01707717257'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LEONARDO NASCIMENTO RODRIGUES | mat=5902716 | cpf=79406360225
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902716', 'LEONARDO NASCIMENTO RODRIGUES', 'GRH',
  '79406360225', 'leonardo.rodrigues@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '79406360225');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '79406360225'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LETICIA CARLA REGO ALVES | mat=4222779 | cpf=01861343205
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222779', 'LETICIA CARLA REGO ALVES', 'SECPROFISCO',
  '01861343205', 'leticia.alves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01861343205');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01861343205'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LETICIA CONTENTE PINHEIRO | mat=5993375 | cpf=07085706236
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5993375', 'LETICIA CONTENTE PINHEIRO', 'SECPRPV',
  '07085706236', 'leticia.pinheiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '07085706236');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '07085706236'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LETICIA DIAS CORREA | mat=5979048 | cpf=02569836230
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979048', 'LETICIA DIAS CORREA', 'SECPCON',
  '02569836230', 'leticia.correa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02569836230');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02569836230'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LETICIA SOUZA DA SILVA | mat=5982459 | cpf=05277170294
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5982459', 'LETICIA SOUZA DA SILVA', 'SECPCON',
  '05277170294', 'leticia.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05277170294');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05277170294'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LIANE MARIA MACHADO MELO | mat=54190339 | cpf=45061599268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54190339', 'LIANE MARIA MACHADO MELO', 'GRH',
  '45061599268', 'liane.melo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '45061599268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '45061599268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LIDIELSON DA LUZ RIBEIRO | mat=54194586 | cpf=56444656249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54194586', 'LIDIELSON DA LUZ RIBEIRO', 'GMAP',
  '56444656249', 'lidielson.ribeiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '56444656249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '56444656249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LILIAN KETHLIN DA SILVA DIAS | mat=54193917 | cpf=62051725268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54193917', 'LILIAN KETHLIN DA SILVA DIAS', 'GRH',
  '62051725268', 'lilian.dias@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '62051725268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '62051725268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LIVIA MARIA NASCIMENTO RIBEIRO | mat=4221499 | cpf=03051918296
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4221499', 'LIVIA MARIA NASCIMENTO RIBEIRO', 'SECPRPV',
  '03051918296', 'livia.ribeiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03051918296');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03051918296'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LIZANDRA MACEDO PIMENTEL | mat=5994552 | cpf=03149175275
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994552', 'LIZANDRA MACEDO PIMENTEL', 'ESAP',
  '03149175275', 'lizandra.pimentel@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03149175275');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03149175275'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LORENA DAHAS JORGE DE SOUZA KOENIG | mat=55589089 | cpf=72043636200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55589089', 'LORENA DAHAS JORGE DE SOUZA KOENIG', 'GRH',
  '72043636200', 'lorena.koenig@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '72043636200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '72043636200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUANA CONCEICAO MAUES | mat=57195469 | cpf=56616910253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57195469', 'LUANA CONCEICAO MAUES', 'PDA',
  '56616910253', 'luana.maues@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '56616910253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '56616910253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCAS LOBATO DA SILVA | mat=5983138 | cpf=01857140214
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5983138', 'LUCAS LOBATO DA SILVA', 'SECPCON',
  '01857140214', 'lucas.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01857140214');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01857140214'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCAS OLIVEIRA DE ALMEIDA SOBRINHO | mat=57221039 | cpf=70766118215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57221039', 'LUCAS OLIVEIRA DE ALMEIDA SOBRINHO', 'GRH',
  '70766118215', 'lucas.sobrinho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '70766118215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '70766118215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCAS PEREIRA GOMES | mat=5996064 | cpf=03632444250
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5996064', 'LUCAS PEREIRA GOMES', 'SECPCTA',
  '03632444250', 'lucas.gomes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03632444250');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03632444250'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCAS PIMENTEL DA SILVA | mat=5964283 | cpf=04212844206
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5964283', 'LUCAS PIMENTEL DA SILVA', 'SECPCTA',
  '04212844206', 'lucas.psilva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04212844206');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04212844206'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCAS SOUZA ALVES DE FIGUEIREDO | mat=4222782 | cpf=07536754205
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222782', 'LUCAS SOUZA ALVES DE FIGUEIREDO', 'GMAP',
  '07536754205', 'lucas.figueiredo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '07536754205');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '07536754205'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCIANA CONCEICAO DE SOUSA | mat=4223730 | cpf=01805907239
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223730', 'LUCIANA CONCEICAO DE SOUSA', 'SECPDA',
  '01805907239', 'luciana.sousa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01805907239');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01805907239'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCIANA DE PAIVA MARTINS TRINDADE SOUZA | mat=55586816 | cpf=57551588272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55586816', 'LUCIANA DE PAIVA MARTINS TRINDADE SOUZA', 'GRH',
  '57551588272', 'luciana.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '57551588272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '57551588272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCIANA PINHEIRO DE BARROS | mat=57195622 | cpf=59550830225
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57195622', 'LUCIANA PINHEIRO DE BARROS', 'GRH',
  '59550830225', 'luciana.barros@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '59550830225');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '59550830225'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUCIANO JUNIOR SILVA DA SILVA | mat=5931495 | cpf=01233282255
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5931495', 'LUCIANO JUNIOR SILVA DA SILVA', 'SECPCON',
  '01233282255', 'luciano.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01233282255');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01233282255'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUIS FELIPE CARNEVALE LIMA | mat=5994348 | cpf=06971097203
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994348', 'LUIS FELIPE CARNEVALE LIMA', 'SECPDA',
  '06971097203', 'luis.lima@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06971097203');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06971097203'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUIS PAULO FONSECA CORREA | mat=5954709 | cpf=57809674234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5954709', 'LUIS PAULO FONSECA CORREA', 'GCONT',
  '57809674234', 'luis.pcorrea@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '57809674234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '57809674234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUIZ EDUARDO DE SOUZA | mat=5186544 | cpf=26927799249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5186544', 'LUIZ EDUARDO DE SOUZA', 'GRH',
  '26927799249', 'luiz.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '26927799249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '26927799249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- LUIZA MARTYRES GUEIROS | mat=5992141 | cpf=02152813227
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992141', 'LUIZA MARTYRES GUEIROS', 'SECPCTA',
  '02152813227', 'luiza.gueiros@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02152813227');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02152813227'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MANOELA MORGADO MARTINS | mat=57198210 | cpf=44047924253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57198210', 'MANOELA MORGADO MARTINS', 'GRH',
  '44047924253', 'manoela.martins@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '44047924253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '44047924253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MANUELLA DE ANDRADE LOBATO | mat=4222789 | cpf=03827076218
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222789', 'MANUELLA DE ANDRADE LOBATO', 'SECPRPV',
  '03827076218', 'manuella.lobato@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03827076218');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03827076218'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCELA ALVES TOSTES MONTENEGRO DUARTE | mat=54189554 | cpf=81353855287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54189554', 'MARCELA ALVES TOSTES MONTENEGRO DUARTE', 'GRH',
  '81353855287', 'marcela.duarte@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '81353855287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '81353855287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCELA DO VALLE FARIAS | mat=5888112 | cpf=90872398234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5888112', 'MARCELA DO VALLE FARIAS', 'SECPDA',
  '90872398234', 'marcela.farias@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '90872398234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '90872398234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCELLA FEIJO CRUZ | mat=5992071 | cpf=96543680210
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992071', 'MARCELLA FEIJO CRUZ', 'SECPCTA',
  '96543680210', 'marcella.cruz@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '96543680210');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '96543680210'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCELO ARAUJO DE ALBUQUERQUE JASSE | mat=5976354 | cpf=76877531272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5976354', 'MARCELO ARAUJO DE ALBUQUERQUE JASSE', 'SECPCON',
  '76877531272', 'marcelo.jasse@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '76877531272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '76877531272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCIO ANDRE MONTEIRO GAIA | mat=80845643 | cpf=44964218287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '80845643', 'MARCIO ANDRE MONTEIRO GAIA', 'PCTA',
  '44964218287', 'marcio.gaia@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '44964218287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '44964218287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCIO AUGUSTO MARQUES DE AZEVEDO | mat=5992082 | cpf=93216831272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992082', 'MARCIO AUGUSTO MARQUES DE AZEVEDO', 'SECPCON',
  '93216831272', 'marcio.azevedo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '93216831272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '93216831272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCIO DE SOUZA PESSOA | mat=5902710 | cpf=74217607253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902710', 'MARCIO DE SOUZA PESSOA', 'GRH',
  '74217607253', 'marcio.pessoa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '74217607253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '74217607253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCIO GONCALVES DA FONSECA SILVEIRA | mat=5992232 | cpf=02139913221
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992232', 'MARCIO GONCALVES DA FONSECA SILVEIRA', 'SECPDA',
  '02139913221', 'marcio.silveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02139913221');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02139913221'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARCO ANTONIO PESSOA COSTA | mat=5979910 | cpf=03598234244
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979910', 'MARCO ANTONIO PESSOA COSTA', 'SECPFAM',
  '03598234244', 'marco.costa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03598234244');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03598234244'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARIA APARECIDA VARANDA DIAS | mat=3264033 | cpf=25508245200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '3264033', 'MARIA APARECIDA VARANDA DIAS', 'GRH',
  '25508245200', 'maria.dias@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '25508245200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '25508245200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARIA CLARA DE VASCONCELOS ANSELMO | mat=4223306 | cpf=06081366200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223306', 'MARIA CLARA DE VASCONCELOS ANSELMO', 'SECPCTA',
  '06081366200', 'maria.anselmo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06081366200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06081366200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARIA DULCE AMARAL MOUSINHO | mat=57196087 | cpf=03889734200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57196087', 'MARIA DULCE AMARAL MOUSINHO', 'GRH',
  '03889734200', 'maria.mousinho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03889734200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03889734200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARIA HELENA DA SILVA DAMASCENO | mat=5999735 | cpf=01849465223
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5999735', 'MARIA HELENA DA SILVA DAMASCENO', 'SECPRPV',
  '01849465223', 'maria.damasceno@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01849465223');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01849465223'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARIA LIDUINA BEZERRA FERNANDES | mat=5649978 | cpf=26706636215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5649978', 'MARIA LIDUINA BEZERRA FERNANDES', 'SECPCTA',
  '26706636215', 'maria.fernandes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '26706636215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '26706636215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARILIA DE JESUS CABRAL | mat=5979285 | cpf=89265815272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979285', 'MARILIA DE JESUS CABRAL', 'SECPCON',
  '89265815272', 'marilia.cabral@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '89265815272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '89265815272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARILIA LISBOA FRANCES | mat=57224878 | cpf=17002800230
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57224878', 'MARILIA LISBOA FRANCES', 'SECPCTA',
  '17002800230', 'marilia.frances@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '17002800230');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '17002800230'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARINA BORDALO BARBOSA | mat=4223305 | cpf=02932775243
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223305', 'MARINA BORDALO BARBOSA', 'ESAP',
  '02932775243', 'marina.barbosa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02932775243');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02932775243'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARIO ANTONIO PEREIRA DE OLIVEIRA | mat=5952813 | cpf=81806760215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5952813', 'MARIO ANTONIO PEREIRA DE OLIVEIRA', 'DTI',
  '81806760215', 'mario.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '81806760215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '81806760215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARIO AUGUSTO MILHOMEM MALATO | mat=5857562 | cpf=63659379204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5857562', 'MARIO AUGUSTO MILHOMEM MALATO', 'GRH',
  '63659379204', 'mario.malato@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63659379204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63659379204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARISA ROCHA LOBATO | mat=3155960 | cpf=17491444253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '3155960', 'MARISA ROCHA LOBATO', 'GRH',
  '17491444253', 'marisa.lobato@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '17491444253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '17491444253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARISE PAES BARRETO MARQUES | mat=57191842 | cpf=26495716249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57191842', 'MARISE PAES BARRETO MARQUES', 'GRH',
  '26495716249', 'marise.marques@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '26495716249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '26495716249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARLENILSON LUIZ PINHEIRO MIRANDA | mat=57190699 | cpf=56361955249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57190699', 'MARLENILSON LUIZ PINHEIRO MIRANDA', 'GRH',
  '56361955249', 'marlenilson.miranda@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '56361955249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '56361955249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARLISON RAMON GOMES NUNES | mat=5918143 | cpf=00344722236
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5918143', 'MARLISON RAMON GOMES NUNES', 'SECPRPV',
  '00344722236', 'marlison.nunes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00344722236');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00344722236'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARLON JOSE FERREIRA DE BRITO | mat=57175693 | cpf=37982699200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175693', 'MARLON JOSE FERREIRA DE BRITO', 'GRH',
  '37982699200', 'marlon.brito@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '37982699200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '37982699200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MARTA NASSAR CRUZ | mat=12477036 | cpf=59682000220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '12477036', 'MARTA NASSAR CRUZ', 'GRH',
  '59682000220', 'marta.cruz@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '59682000220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '59682000220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MATEUS CRUZ RABELO | mat=5930246 | cpf=03626744264
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5930246', 'MATEUS CRUZ RABELO', 'SECPCTA',
  '03626744264', 'mateus.rabelo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03626744264');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03626744264'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MATEUS DA SILVA COUTINHO | mat=5991196 | cpf=06220507290
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991196', 'MATEUS DA SILVA COUTINHO', 'SECPCTA',
  '06220507290', 'mateus.coutinho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06220507290');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06220507290'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MATHEUS MONTAO MEDEIROS | mat=6403683 | cpf=02098942290
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '6403683', 'MATHEUS MONTAO MEDEIROS', 'SECPCTA',
  '02098942290', 'matheus.medeiros@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02098942290');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02098942290'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MATHEUS WILLIAMS SANTOS DE LEAO | mat=5946937 | cpf=03968870239
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5946937', 'MATHEUS WILLIAMS SANTOS DE LEAO', 'SECPCTA',
  '03968870239', 'matheus.leao@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03968870239');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03968870239'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MAURA MARCELINO SILVA ASSIS | mat=5974037 | cpf=02465257200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5974037', 'MAURA MARCELINO SILVA ASSIS', 'SECPCTA',
  '02465257200', 'maura.assis@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02465257200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02465257200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MAYKON WARLLEY ROSARIO MENDES | mat=5987124 | cpf=99537265234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5987124', 'MAYKON WARLLEY ROSARIO MENDES', 'DTI',
  '99537265234', 'maykon.mendes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '99537265234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '99537265234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MAYLANA MONTEIRO DE SOUSA | mat=5994810 | cpf=09416239208
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994810', 'MAYLANA MONTEIRO DE SOUSA', 'SECPCTA',
  '09416239208', 'maylana.sousa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '09416239208');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '09416239208'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MICHEL MORAIS DE MIRANDA | mat=5979720 | cpf=52939375291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979720', 'MICHEL MORAIS DE MIRANDA', 'GEOF',
  '52939375291', 'michel.miranda@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '52939375291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '52939375291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MICHELINE ANTUNES ESTEVES BITAR | mat=54195625 | cpf=59204311215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54195625', 'MICHELINE ANTUNES ESTEVES BITAR', 'GRH',
  '59204311215', 'micheline.bitar@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '59204311215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '59204311215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MICHELLY ALCANTARA DA SILVA DE MENDONCA | mat=57176236 | cpf=59204389249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57176236', 'MICHELLY ALCANTARA DA SILVA DE MENDONCA', 'GRH',
  '59204389249', 'michelly.mendonca@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '59204389249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '59204389249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MILDRED LIMA PITMAN DE OLIVEIRA | mat=55587300 | cpf=56057490215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55587300', 'MILDRED LIMA PITMAN DE OLIVEIRA', 'GRH',
  '56057490215', 'mildred.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '56057490215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '56057490215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MILENE CARDOSO FERREIRA | mat=57217411 | cpf=36782947234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57217411', 'MILENE CARDOSO FERREIRA', 'GRH',
  '36782947234', 'milene.ferreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '36782947234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '36782947234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MILENE MIRANDA LUCAS | mat=6008006 | cpf=91254248234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '6008006', 'MILENE MIRANDA LUCAS', 'SECPRPV',
  '91254248234', 'milene.lucas@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '91254248234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '91254248234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MIRYAM DE ALMEIDA CARVALHO DUARTE | mat=5972664 | cpf=48920410259
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5972664', 'MIRYAM DE ALMEIDA CARVALHO DUARTE', 'SECPDA',
  '48920410259', 'miryam.duarte@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '48920410259');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '48920410259'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MOISES AZEVEDO CAMPOS | mat=57175156 | cpf=51755637268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175156', 'MOISES AZEVEDO CAMPOS', 'GRH',
  '51755637268', 'moises.campos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '51755637268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '51755637268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MONALISA DE MIRANDA FURTADO | mat=5957998 | cpf=01902328205
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5957998', 'MONALISA DE MIRANDA FURTADO', 'SECPCTA',
  '01902328205', 'monalisa.furtado@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01902328205');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01902328205'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- MONIQUE CAROLINE DOS SANTOS DA LUZ | mat=6315019 | cpf=01898471231
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '6315019', 'MONIQUE CAROLINE DOS SANTOS DA LUZ', 'SECPCTA',
  '01898471231', 'monique.luz@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01898471231');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01898471231'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- NAGILA DA SILVA SAUAIA | mat=5902792 | cpf=86033980204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902792', 'NAGILA DA SILVA SAUAIA', 'PCON',
  '86033980204', 'nagila.sauaia@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '86033980204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '86033980204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- NAPOLEAO NICOLAU DA COSTA NETO | mat=5991156 | cpf=75757575204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5991156', 'NAPOLEAO NICOLAU DA COSTA NETO', 'PCTA',
  '75757575204', 'napoleao.neto@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '75757575204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '75757575204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- NARA NAIANE PINHEIRO SILVA | mat=5999053 | cpf=00327730218
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5999053', 'NARA NAIANE PINHEIRO SILVA', 'SECPCTA',
  '00327730218', 'nara.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00327730218');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00327730218'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- NICOLAS MANOEL CARVALHO VIEIRA | mat=4223165 | cpf=05785668262
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223165', 'NICOLAS MANOEL CARVALHO VIEIRA', 'SECPGOV',
  '05785668262', 'nicolas.vieira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05785668262');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05785668262'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- NILCE CONCEICAO ALVES SUDO | mat=55589018 | cpf=26559420272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55589018', 'NILCE CONCEICAO ALVES SUDO', 'GRH',
  '26559420272', 'nilce.sudo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '26559420272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '26559420272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- NINIVE FACIOLA NAIF DAIBES DE SOUZA | mat=57214480 | cpf=83223479287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57214480', 'NINIVE FACIOLA NAIF DAIBES DE SOUZA', 'GRH',
  '83223479287', 'ninive.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '83223479287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '83223479287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- NOEMY LIRA NASCIMENTO | mat=5917537 | cpf=03147252299
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5917537', 'NOEMY LIRA NASCIMENTO', 'COFIN',
  '03147252299', 'noemy.nascimento@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03147252299');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03147252299'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- NORMA SUELI FORMIGOSA DE LIMA SILVA | mat=51855915 | cpf=44980728200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '51855915', 'NORMA SUELI FORMIGOSA DE LIMA SILVA', 'GRH',
  '44980728200', 'norma.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '44980728200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '44980728200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- OSEAS TEIXEIRA DE ARAUJO | mat=722235 | cpf=18796095253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '722235', 'OSEAS TEIXEIRA DE ARAUJO', 'GRH',
  '18796095253', 'oseas.araujo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '18796095253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '18796095253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- OSVALDINO SILVA JUNIOR | mat=5703573 | cpf=13379003204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5703573', 'OSVALDINO SILVA JUNIOR', 'GRH',
  '13379003204', 'osvaldino.junior@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '13379003204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '13379003204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- OTHON SODRE DE SOUSA | mat=5979054 | cpf=48066672268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5979054', 'OTHON SODRE DE SOUSA', 'DTI',
  '48066672268', 'othon.sousa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '48066672268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '48066672268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAOLA FERREIRA PITMAN | mat=5919045 | cpf=92701710278
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5919045', 'PAOLA FERREIRA PITMAN', 'SECPCON',
  '92701710278', 'paola.pitman@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '92701710278');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '92701710278'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PATRICIA CARLA RAPOSO PAIVA | mat=57176376 | cpf=72785020391
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57176376', 'PATRICIA CARLA RAPOSO PAIVA', 'PCON',
  '72785020391', 'patricia.paiva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '72785020391');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '72785020391'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAULA DANYELA COSTA DE OLIVEIRA | mat=4223583 | cpf=02671992289
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223583', 'PAULA DANYELA COSTA DE OLIVEIRA', 'SECPDA',
  '02671992289', 'paula.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02671992289');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02671992289'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAULA DINIZ CONDURU | mat=4223308 | cpf=01930922205
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223308', 'PAULA DINIZ CONDURU', 'SECPDA',
  '01930922205', 'paula.conduru@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01930922205');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01930922205'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAULA EDUARDA CARDOSO LEITE | mat=5992538 | cpf=02157606203
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992538', 'PAULA EDUARDA CARDOSO LEITE', 'SECPCTA',
  '02157606203', 'paula.leite@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02157606203');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02157606203'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAULA GUIMARAES SOUSA SILVA | mat=51855551 | cpf=74236920263
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '51855551', 'PAULA GUIMARAES SOUSA SILVA', 'GRH',
  '74236920263', 'paula.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '74236920263');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '74236920263'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAULA QUEIROZ OLIVEIRA COSTA SOUZA | mat=7001227 | cpf=61521590320
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '7001227', 'PAULA QUEIROZ OLIVEIRA COSTA SOUZA', 'GRH',
  '61521590320', 'paula.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '61521590320');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '61521590320'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAULA ZUMERO | mat=54181029 | cpf=41110668287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54181029', 'PAULA ZUMERO', 'GAB',
  '41110668287', 'paula.zumero@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '41110668287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '41110668287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAULO RUBIO HANNA MEIRA | mat=5982711 | cpf=01077302274
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5982711', 'PAULO RUBIO HANNA MEIRA', 'SECPROFISCO',
  '01077302274', 'paulo.meira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01077302274');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01077302274'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PAULO VINICIUS DA SILVA SOUSA | mat=5980789 | cpf=60604089317
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5980789', 'PAULO VINICIUS DA SILVA SOUSA', 'SECPRPV',
  '60604089317', 'paulo.sousa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '60604089317');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '60604089317'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PEDRO FERNANDO BALDEZ VASCONCELOS | mat=5903483 | cpf=83959203268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5903483', 'PEDRO FERNANDO BALDEZ VASCONCELOS', 'GRH',
  '83959203268', 'pedro.vasconcelos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '83959203268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '83959203268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PEDRO THIAGO BRAGA ALVES | mat=4223337 | cpf=04122447216
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223337', 'PEDRO THIAGO BRAGA ALVES', 'DTI',
  '04122447216', 'pedro.alves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04122447216');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04122447216'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- PENELOPE EMELY BARBOSA GOMES | mat=5951289 | cpf=04748540273
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5951289', 'PENELOPE EMELY BARBOSA GOMES', 'SECCOFIN',
  '04748540273', 'penelope.gomes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04748540273');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04748540273'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- POLYANA MAGALHAES FERREIRA | mat=57196797 | cpf=48661597234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57196797', 'POLYANA MAGALHAES FERREIRA', 'GRH',
  '48661597234', 'polyana.ferreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '48661597234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '48661597234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RAFAEL SOUSA DO ESPIRITO SANTO | mat=5969114 | cpf=00129859290
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969114', 'RAFAEL SOUSA DO ESPIRITO SANTO', 'SECPCON',
  '00129859290', 'rafael.santo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00129859290');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00129859290'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RAIMUNDO NONATO RODRIGUES BARROS | mat=55589432 | cpf=12969540215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55589432', 'RAIMUNDO NONATO RODRIGUES BARROS', 'GRH',
  '12969540215', 'raimundo.barros@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '12969540215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '12969540215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RAIMUNDO SABBA GUIMARAES NETO | mat=57191850 | cpf=60904909204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57191850', 'RAIMUNDO SABBA GUIMARAES NETO', 'PCTA',
  '60904909204', 'raimundo.neto@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '60904909204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '60904909204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RAISSA GEORGIA MARINHO VASCONCELOS | mat=5528223 | cpf=01853024244
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5528223', 'RAISSA GEORGIA MARINHO VASCONCELOS', 'SECPGOV',
  '01853024244', 'raissa.vasconcelos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01853024244');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01853024244'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RAQUEL ALVES DE MORAES | mat=4223728 | cpf=03249931292
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223728', 'RAQUEL ALVES DE MORAES', 'ESAP',
  '03249931292', 'raquel.moraes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03249931292');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03249931292'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RAYSSA BORGES MARTINS | mat=4222778 | cpf=70159024277
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222778', 'RAYSSA BORGES MARTINS', 'NUPLAN',
  '70159024277', 'rayssa.martins@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '70159024277');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '70159024277'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RAYSSA LORANNE DA SILVA DIAS | mat=5999046 | cpf=04575323276
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5999046', 'RAYSSA LORANNE DA SILVA DIAS', 'SECPDA',
  '04575323276', 'rayssa.dias@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04575323276');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04575323276'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- REBECA PAMPOLHA DE CARVALHO | mat=5965821 | cpf=01347253289
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5965821', 'REBECA PAMPOLHA DE CARVALHO', 'GRH',
  '01347253289', 'rebeca.carvalho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01347253289');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01347253289'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- REGINA DO SOCORRO DIAS DA SILVA | mat=5986058 | cpf=76805921287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5986058', 'REGINA DO SOCORRO DIAS DA SILVA', 'SECPDA',
  '76805921287', 'regina.ssilva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '76805921287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '76805921287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- REGINALDO DA SILVA RAMOS | mat=57189869 | cpf=42612039287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57189869', 'REGINALDO DA SILVA RAMOS', 'GRH',
  '42612039287', 'reginaldo.ramos@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '42612039287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '42612039287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RENATA MAGALHAES CARVALHO | mat=5976365 | cpf=03460994398
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5976365', 'RENATA MAGALHAES CARVALHO', 'SECPDA',
  '03460994398', 'renata.carvalho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03460994398');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03460994398'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RENATA MARQUES CORREA | mat=5992228 | cpf=01991743262
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992228', 'RENATA MARQUES CORREA', 'SECPCTA',
  '01991743262', 'renata.correa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01991743262');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01991743262'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RENATO NUNES VALLE | mat=57174288 | cpf=56132840249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57174288', 'RENATO NUNES VALLE', 'GRH',
  '56132840249', 'renato.valle@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '56132840249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '56132840249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RIKELLE MIRANDA DE SOUZA | mat=5994460 | cpf=04941583280
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994460', 'RIKELLE MIRANDA DE SOUZA', 'ESAP',
  '04941583280', 'rikelle.souza@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04941583280');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04941583280'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RILDO AUGUSTO VALOIS LAURENTINO | mat=54195283 | cpf=63053713268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54195283', 'RILDO AUGUSTO VALOIS LAURENTINO', 'PCTA',
  '63053713268', 'rildo.laurentino@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63053713268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63053713268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROBERTA CARVALHO DA SILVA | mat=5969519 | cpf=00215628225
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969519', 'ROBERTA CARVALHO DA SILVA', 'P1AR',
  '00215628225', 'roberta.csilva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00215628225');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00215628225'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROBERTO LADEIRA REIS | mat=5969510 | cpf=89845447287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969510', 'ROBERTO LADEIRA REIS', 'P1AR',
  '89845447287', 'roberto.reis@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '89845447287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '89845447287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROBERTO RIBEIRO DA CUNHA | mat=55585697 | cpf=42448735204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55585697', 'ROBERTO RIBEIRO DA CUNHA', 'GRH',
  '42448735204', 'roberto.cunha@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '42448735204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '42448735204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROBERTO WILLIAMS DE JESUS PEREIRA | mat=5951264 | cpf=01241309256
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5951264', 'ROBERTO WILLIAMS DE JESUS PEREIRA', 'SECPFAM',
  '01241309256', 'roberto.pereira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01241309256');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01241309256'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RODRIGO CESAR FRANCA DE OLIVEIRA | mat=5972393 | cpf=02980209201
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5972393', 'RODRIGO CESAR FRANCA DE OLIVEIRA', 'SECPCTA',
  '02980209201', 'rodrigo.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02980209201');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02980209201'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RODRIGO GARCIA DE ALBUQUERQUE LIMA | mat=5902903 | cpf=93993285204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902903', 'RODRIGO GARCIA DE ALBUQUERQUE LIMA', 'GRH',
  '93993285204', 'rodrigo.lima@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '93993285204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '93993285204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RODRIGO GONDIM DA SERRA | mat=55588457 | cpf=69740771220
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55588457', 'RODRIGO GONDIM DA SERRA', 'GRH',
  '69740771220', 'rodrigo.serra@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '69740771220');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '69740771220'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RODRIGO MEDEIROS DE MENDONCA | mat=55208897 | cpf=82932786253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55208897', 'RODRIGO MEDEIROS DE MENDONCA', 'SECPDA',
  '82932786253', 'rodrigo.mendonca@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '82932786253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '82932786253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RODRIGO SANTANA AMORAS DE LIMA | mat=4221363 | cpf=04797270233
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4221363', 'RODRIGO SANTANA AMORAS DE LIMA', 'GRH',
  '04797270233', 'rodrigo.slima@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04797270233');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04797270233'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROMARIO OLIVEIRA DA SILVA | mat=5997789 | cpf=01862549206
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5997789', 'ROMARIO OLIVEIRA DA SILVA', 'GCONT',
  '01862549206', 'romario.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01862549206');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01862549206'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROMULO DE SOUZA COSTA | mat=5969129 | cpf=00196633230
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5969129', 'ROMULO DE SOUZA COSTA', 'SECPCTA',
  '00196633230', 'romulo.costa@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00196633230');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00196633230'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROSANE MARIA LEITAO NEIVA | mat=303925 | cpf=10238107272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '303925', 'ROSANE MARIA LEITAO NEIVA', 'GRH',
  '10238107272', 'rosane.neiva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '10238107272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '10238107272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROSEANE DE SOUZA NEVES | mat=5968759 | cpf=76507025291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5968759', 'ROSEANE DE SOUZA NEVES', 'SECPCON',
  '76507025291', 'roseane.neves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '76507025291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '76507025291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROSELEIDE DE SOUZA FERREIRA | mat=57175988 | cpf=44080492200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175988', 'ROSELEIDE DE SOUZA FERREIRA', 'GRH',
  '44080492200', 'roseleide.ferreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '44080492200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '44080492200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ROSIELE CARVALHO NUNES | mat=8401426 | cpf=04732578233
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '8401426', 'ROSIELE CARVALHO NUNES', 'SECPCTA',
  '04732578233', 'rosiele.nunes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04732578233');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04732578233'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- RYAN WELLINGTON AZULAY FARIAS | mat=5992074 | cpf=61853578363
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992074', 'RYAN WELLINGTON AZULAY FARIAS', 'SECPDA',
  '61853578363', 'ryan.farias@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '61853578363');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '61853578363'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SAIDY MERCES DOS SANTOS DIAS | mat=42323 | cpf=08135541287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '42323', 'SAIDY MERCES DOS SANTOS DIAS', 'GRH',
  '08135541287', 'saidy.dias@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '08135541287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '08135541287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SAMARINA DE JESUS MINAS MARINHO | mat=54193784 | cpf=59122412204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54193784', 'SAMARINA DE JESUS MINAS MARINHO', 'GRH',
  '59122412204', 'samarina.marinho@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '59122412204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '59122412204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SAMIR JOSE DA SILVA DAMASCENO | mat=57175099 | cpf=72564822215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175099', 'SAMIR JOSE DA SILVA DAMASCENO', 'GRH',
  '72564822215', 'samir.damasceno@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '72564822215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '72564822215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SAMYLA PEREIRA DE AZEVEDO | mat=5902795 | cpf=83960325215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902795', 'SAMYLA PEREIRA DE AZEVEDO', 'GRH',
  '83960325215', 'samyla.azevedo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '83960325215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '83960325215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SANDRA ELYNARA DOS SANTOS LIMA | mat=5958060 | cpf=02405788217
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5958060', 'SANDRA ELYNARA DOS SANTOS LIMA', 'SECPRPV',
  '02405788217', 'sandra.lima@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02405788217');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02405788217'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SHEILA DO SOCORRO SAMPAIO MELLO | mat=55590170 | cpf=65869869234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55590170', 'SHEILA DO SOCORRO SAMPAIO MELLO', 'GRH',
  '65869869234', 'sheila.mello@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '65869869234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '65869869234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SILVANA NAZARE DE ALENCAR RIBEIRO | mat=5968718 | cpf=36473049215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5968718', 'SILVANA NAZARE DE ALENCAR RIBEIRO', 'SECPCTA',
  '36473049215', 'silvana.ribeiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '36473049215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '36473049215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SILVIA MARGARETH FREIRE FARIAS | mat=55589015 | cpf=26480727215
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55589015', 'SILVIA MARGARETH FREIRE FARIAS', 'PCTA',
  '26480727215', 'silvia.farias@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '26480727215');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '26480727215'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SILVIA NATASHA AMERICO DAMASCENO | mat=5902719 | cpf=65934350234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902719', 'SILVIA NATASHA AMERICO DAMASCENO', 'GRH',
  '65934350234', 'silvia.damasceno@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '65934350234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '65934350234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SIMONE DOS PASSOS COSTEIRA | mat=5902817 | cpf=75166003268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902817', 'SIMONE DOS PASSOS COSTEIRA', 'GRH',
  '75166003268', 'simone.costeira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '75166003268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '75166003268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SIMONE FERREIRA LOBAO MOREIRA | mat=54186002 | cpf=62856588204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54186002', 'SIMONE FERREIRA LOBAO MOREIRA', 'GRH',
  '62856588204', 'simone.moreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '62856588204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '62856588204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SIMONE VIEIRA RODRIGUES | mat=5662648 | cpf=17651476204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5662648', 'SIMONE VIEIRA RODRIGUES', 'GRH',
  '17651476204', 'simone.rodrigues@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '17651476204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '17651476204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SOFIA BEGOT BARROS | mat=5994849 | cpf=02090100290
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994849', 'SOFIA BEGOT BARROS', 'SECPCON',
  '02090100290', 'sofia.barros@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02090100290');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02090100290'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SOFIA QUARESMA FERREIRA | mat=55207980 | cpf=03583685296
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55207980', 'SOFIA QUARESMA FERREIRA', 'GLIC',
  '03583685296', 'sofia.ferreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03583685296');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03583685296'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SONIA MARIA PACHECO DE VILHENA | mat=5982315 | cpf=62619993253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5982315', 'SONIA MARIA PACHECO DE VILHENA', 'GSERV',
  '62619993253', 'sonia.vilhena@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '62619993253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '62619993253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- STEFANY NAZARE SARGE GONCALVES | mat=5971477 | cpf=06661547243
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5971477', 'STEFANY NAZARE SARGE GONCALVES', 'SECPCTA',
  '06661547243', 'stefany.goncalves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06661547243');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06661547243'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- STEPHANY VIEIRA ALMEIDA | mat=55207893 | cpf=01868430200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55207893', 'STEPHANY VIEIRA ALMEIDA', 'GRH',
  '01868430200', 'stephany.almeida@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01868430200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01868430200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- SUELLEN VICTORIA ARAUJO DA CUNHA | mat=5963500 | cpf=01141595214
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5963500', 'SUELLEN VICTORIA ARAUJO DA CUNHA', 'SECPDA',
  '01141595214', 'suellen.cunha@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01141595214');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01141595214'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- TAISUKE NOGUCHI | mat=57198174 | cpf=65934881272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57198174', 'TAISUKE NOGUCHI', 'GRH',
  '65934881272', 'taisuke.noguchi@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '65934881272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '65934881272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- TARCILA DE JESUS DO COUTO ABREU SARMENTO | mat=55587311 | cpf=64879534234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55587311', 'TARCILA DE JESUS DO COUTO ABREU SARMENTO', 'GRH',
  '64879534234', 'tarcila.sarmento@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '64879534234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '64879534234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- TAYNNA BARROS PINHEIRO RUFINO | mat=5986066 | cpf=86265628291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5986066', 'TAYNNA BARROS PINHEIRO RUFINO', 'SECPDA',
  '86265628291', 'taynna.rufino@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '86265628291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '86265628291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- TENILI RAMOS PALHARES MEIRA | mat=54193922 | cpf=65043464291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54193922', 'TENILI RAMOS PALHARES MEIRA', 'GRH',
  '65043464291', 'tenili.meira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '65043464291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '65043464291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- THAIS CAMPOS IKETANI | mat=5902973 | cpf=69314446204
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902973', 'THAIS CAMPOS IKETANI', 'GRH',
  '69314446204', 'thais.iketani@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '69314446204');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '69314446204'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- THAIS CARDOSO COIMBRA PROFETI | mat=5902744 | cpf=64182010272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902744', 'THAIS CARDOSO COIMBRA PROFETI', 'GRH',
  '64182010272', 'thais.profeti@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '64182010272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '64182010272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- THAYANE DAS CHAGAS CERQUEIRA | mat=5902705 | cpf=78753112253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902705', 'THAYANE DAS CHAGAS CERQUEIRA', 'GRH',
  '78753112253', 'thayane.cerqueira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '78753112253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '78753112253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- THIAGO COUCEIRO PITMAN MACHADO | mat=5902511 | cpf=83078592200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902511', 'THIAGO COUCEIRO PITMAN MACHADO', 'GRH',
  '83078592200', 'thiago.machado@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '83078592200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '83078592200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- THIAGO LEMOS ALMEIDA | mat=57175194 | cpf=68992971249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175194', 'THIAGO LEMOS ALMEIDA', 'GRH',
  '68992971249', 'thiago.almeida@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '68992971249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '68992971249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- THIAGO VINICIUS DE SENA MELO | mat=4221662 | cpf=00498380246
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4221662', 'THIAGO VINICIUS DE SENA MELO', 'SECPCTA',
  '00498380246', 'thiago.melo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '00498380246');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '00498380246'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- TIAGO DE LIMA FERREIRA | mat=55589694 | cpf=63861666200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55589694', 'TIAGO DE LIMA FERREIRA', 'GRH',
  '63861666200', 'tiago.ferreira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '63861666200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '63861666200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- TIAGO GEDEAO DE CARVALHO MENDONCA | mat=5805333 | cpf=59757485268
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5805333', 'TIAGO GEDEAO DE CARVALHO MENDONCA', 'GRH',
  '59757485268', 'tiago.mendonca@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '59757485268');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '59757485268'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- TIAGO NASSER SEFER | mat=5902770 | cpf=84068990263
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902770', 'TIAGO NASSER SEFER', 'GRH',
  '84068990263', 'tiago.sefer@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '84068990263');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '84068990263'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- TIAGO RAMOS AZEVEDO | mat=7001230 | cpf=71077286287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '7001230', 'TIAGO RAMOS AZEVEDO', 'GRH',
  '71077286287', 'tiago.azevedo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '71077286287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '71077286287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VAGNER ANDREI TEIXEIRA LIMA | mat=54187281 | cpf=51598426249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '54187281', 'VAGNER ANDREI TEIXEIRA LIMA', 'GRH',
  '51598426249', 'vagner.lima@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '51598426249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '51598426249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VANESSA COSTA VILELA | mat=4223317 | cpf=05027838263
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223317', 'VANESSA COSTA VILELA', 'SECPDA',
  '05027838263', 'vanessa.vilela@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05027838263');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05027838263'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VANESSA CRISTINA GOMES BELSHOFF | mat=5985826 | cpf=17579122740
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5985826', 'VANESSA CRISTINA GOMES BELSHOFF', 'SECPCTA',
  '17579122740', 'vanessa.belshoff@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '17579122740');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '17579122740'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VANIA CLEIA DE MELO MARTINS | mat=4223307 | cpf=39912450272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4223307', 'VANIA CLEIA DE MELO MARTINS', 'ESAP',
  '39912450272', 'vania.martins@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '39912450272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '39912450272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VERENA FIGUEIRA CUNHA | mat=5953559 | cpf=03676756258
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5953559', 'VERENA FIGUEIRA CUNHA', 'SECPDA',
  '03676756258', 'verena.cunha@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03676756258');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03676756258'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VERENA LEITAO DE OLIVEIRA | mat=5904359 | cpf=88163024291
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5904359', 'VERENA LEITAO DE OLIVEIRA', 'SECPCON',
  '88163024291', 'verena.oliveira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '88163024291');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '88163024291'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VICTOR LUAN MONTEIRO DA SILVA | mat=5987028 | cpf=06018703289
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5987028', 'VICTOR LUAN MONTEIRO DA SILVA', 'SECPDA',
  '06018703289', 'victor.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06018703289');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06018703289'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VICTOR VALERIO VIANA SAAVEDRA GUIMARAES | mat=5956684 | cpf=03020461278
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5956684', 'VICTOR VALERIO VIANA SAAVEDRA GUIMARAES', 'SECPGOV',
  '03020461278', 'victor.guimaraes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '03020461278');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '03020461278'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VINICIUS RAIOL RIBEIRO | mat=4222415 | cpf=05091360280
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '4222415', 'VINICIUS RAIOL RIBEIRO', 'DTI',
  '05091360280', 'vinicius.ribeiro@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05091360280');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05091360280'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VINICIUS RUFFEIL VASCONCELOS DA SILVA | mat=5994297 | cpf=01958147206
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994297', 'VINICIUS RUFFEIL VASCONCELOS DA SILVA', 'ESAP',
  '01958147206', 'vinicius.silva@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '01958147206');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '01958147206'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VITOR RAMOS EDUARDO | mat=5902749 | cpf=02481352360
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902749', 'VITOR RAMOS EDUARDO', 'GRH',
  '02481352360', 'vitor.eduardo@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02481352360');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02481352360'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VITORIA SOUZA DE MIRANDA | mat=5994322 | cpf=04238620224
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5994322', 'VITORIA SOUZA DE MIRANDA', 'SECPCTA',
  '04238620224', 'vitoria.miranda@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '04238620224');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '04238620224'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- VIVIANNE CARLA DE OLIVEIRA GAMA PEREIRA | mat=57175255 | cpf=58554114272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57175255', 'VIVIANNE CARLA DE OLIVEIRA GAMA PEREIRA', 'GRH',
  '58554114272', 'vivianne.pereira@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '58554114272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '58554114272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- WAGNER APARECIDO DA CRUZ | mat=5454328 | cpf=06279513840
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5454328', 'WAGNER APARECIDO DA CRUZ', 'GRH',
  '06279513840', 'wagner.cruz@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '06279513840');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '06279513840'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- WAGNER OLIVEIRA MOURA | mat=57197937 | cpf=62621696287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57197937', 'WAGNER OLIVEIRA MOURA', 'GRH',
  '62621696287', 'wagner.moura@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '62621696287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '62621696287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- WALLACE RENATO DE MELO MORAIS | mat=5310784 | cpf=26024144253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5310784', 'WALLACE RENATO DE MELO MORAIS', 'SECPFAM',
  '26024144253', 'wallace.morais@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '26024144253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '26024144253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- WANDERSON CARLOS DA COSTA LOPES | mat=5970737 | cpf=88845184234
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5970737', 'WANDERSON CARLOS DA COSTA LOPES', 'DTI',
  '88845184234', 'wanderson.lopes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '88845184234');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '88845184234'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- WANZERLEY GOMES MIRANDA | mat=5992282 | cpf=05127872200
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992282', 'WANZERLEY GOMES MIRANDA', 'SECPRPV',
  '05127872200', 'wanzerley.miranda@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '05127872200');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '05127872200'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- WENDER DA CUNHA MENDES | mat=55589333 | cpf=61377910253
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '55589333', 'WENDER DA CUNHA MENDES', 'GRH',
  '61377910253', 'wender.mendes@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '61377910253');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '61377910253'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- WILLIAM WALLACE RODRIGUES FREITAS | mat=5951271 | cpf=02095031229
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5951271', 'WILLIAM WALLACE RODRIGUES FREITAS', 'SECPROFISCO',
  '02095031229', 'william.freitas@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '02095031229');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '02095031229'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- WILTON LEITE GONCALVES | mat=5992222 | cpf=94033080287
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5992222', 'WILTON LEITE GONCALVES', 'P3AR',
  '94033080287', 'wilton.goncalves@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '94033080287');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '94033080287'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- YURI LENIN DUARTE JINKINGS | mat=5902797 | cpf=80786022272
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '5902797', 'YURI LENIN DUARTE JINKINGS', 'GRH',
  '80786022272', 'yuri.jinkings@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '80786022272');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '80786022272'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

-- ZAIRA CECILIA DINIZ RODRIGUES | mat=57173832 | cpf=69546975249
INSERT INTO usuarios (
  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt
)
SELECT
  '57173832', 'ZAIRA CECILIA DINIZ RODRIGUES', 'GRH',
  '69546975249', 'zaira.rodrigues@pge.pa.gov.br', '987654321',
  '$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly', NOW(), NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = '69546975249');

INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)
SELECT u.id, 1, NOW(), NOW()
FROM usuarios u
WHERE u.cpf = '69546975249'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);

COMMIT;

-- Verification helpers:
-- SELECT COUNT(*) FROM usuarios;
-- SELECT inscription, name, department, cpf, email, phone FROM usuarios WHERE phone = '987654321' ORDER BY id DESC LIMIT 20;
