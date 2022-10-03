USE steam_store
GO
--FILL DATA

INSERT INTO account VALUES
('ACC0000001', 'botol_minum', '192.168.100.3', 'Denpasar', 'Indonesia'),
('ACC0000002', 'tupperware_makan', '192.168.13.2', 'Jakarta', 'Indonesia'),
('ACC0000003', 'database_god', '168.189.23.2', 'New York', 'United States of America'),
('ACC0000004', 'dank_memes', '192.168.69.69', 'Bangladesh', 'India'),
('ACC0000005', 'jebios', '192.168.100.1', 'Denpasar', 'Indonesia'),
('ACC0000006', 'EpicGamerrrrr', '192.168.20.2', 'Tokyo', 'Japan'),
('ACC0000007', 'Joshua', '192.168.30.4', 'Makassar', 'Indonesia'),
('ACC0000008', 'Mole', '128.100.20.1', 'Sydney', 'Australia'),
('ACC0000009', 'MLG_Sniper_X', '128.50.20.1', 'Los Angeles', 'United States of America'),
('ACC0000010', 'paper_cutter', '128.10.10.2', 'Osaka', 'Japan')

INSERT INTO developer VALUES
('DEV0000001', 'Bandai Namco', '243.78.184.58', 'Japan'),
('DEV0000002', 'Capcom', '92.108.17.8', 'Japan'),
('DEV0000003', 'Ubisoft', '192.102.28.149', 'United States of America'),
('DEV0000004', 'Pero Pero Games', '51.30.187.94', 'China'),
('DEV0000005', 'Valve', '55.84.143.136', 'United States of America'),
('DEV0000006', 'Electronic Arts', '214.209.49.165', 'United States of America'),
('DEV0000007', 'Blender Foundation', '133.101.136.201', 'United States of America'),
('DEV0000008', 'Community', '172.217. 22.14', 'United States of America')


INSERT INTO payment VALUES
('PAY0000001', 'Bank', 'BCA'),
('PAY0000002', 'Bank', 'Mandiri'),
('PAY0000003', 'Bank', 'Bank of America'),
('PAY0000004', 'Bank', 'JPMorgan Chase'),
('PAY0000005', 'Bank', 'BRI'),
('PAY0000006', 'Bank', 'Japan Post Bank'),
('PAY0000007', 'Bank', 'Punjab and Sind Bank'),
('PAY0000008', 'DANA', 'Dana currency'),
('PAY0000009', 'Go-Pay', 'Go-pay currency'),
('PAY0000010', 'Bank', 'AMP Bank'),
('PAY0000011', 'Steam', 'Steam Wallet')

INSERT INTO vat VALUES
('244650692276395', 0.1),
('446091337935027', 0.1),
('535146334963746', 0),
('026964686838070', 0.12),
('060405635900335', 0.12),
('663607441489302', 0.18),
('340142156510987', 0.12),
('289034592771077', 0.1),
('990165876212030', 0.1),
('345343142505935', 0.2)

INSERT INTO discount VALUES
('DSC334412742348', 'Winter Sale', 0.4),
('DSC608112728608', 'Autumn Sale', 0.35),
('DSC881569337902', 'New Year Sale', 0.85),
('DSC450088175191', 'Lebaran Sale', 0.5),
('DSC156142850162', 'Weekend Suprise', 0.3),
('DSC248751203207', 'No Discount', 0)

INSERT INTO product_type VALUES
('PDT0000001', 'Software'),
('PDT0000002', 'Video Game'),
('PDT0000003', 'Wallet'),
('PDT0000004', 'Downloadable Content'),
('PDT0000005', 'Demo'),
('PDT0000006', 'Video'),
('PDT0000007', 'Mods'),
('PDT0000008', 'Hardware')

INSERT INTO product VALUES
('PD00000001', 'DEV0000007', 'DSC248751203207', 'Blender', 'PDT0000001', '0'),
('PD00000002', 'DEV0000005', 'DSC248751203207', 'Counter Strike: Global Offensive', 'PDT0000002', '0'),
('PD00000003', 'DEV0000003', 'DSC450088175191', 'Assassins Creed Origins - The Hidden Ones', 'PDT0000004', '100000'),
('PD00000004', 'DEV0000008', 'DSC248751203207', 'Left 4 Dead 2: Worn Out M16', 'PDT0000007', '0'), 
('PD00000005', 'DEV0000002', 'DSC334412742348', 'Devil May Cry 4: Special Edition', 'PDT0000002', '206000'),
('PD00000006', 'DEV0000004', 'DSC334412742348', 'Muse Dash: Deluxe Edition', 'PDT0000002', '370000')

INSERT INTO transaction_header VALUES
('74737003377098649023', 'ACC0000001', '2017-12-14', 'PAY0000001', '244650692276395'),
('65791929222796977052', 'ACC0000002', '2018-03-16', 'PAY0000002', '446091337935027'),
('16849882781093276057', 'ACC0000003', '2019-10-24', 'PAY0000003', '535146334963746'),
('17317006746830902339', 'ACC0000004', '2021-04-20', 'PAY0000007', '663607441489302'),
('44549466125797899841', 'ACC0000005', '2021-11-19', 'PAY0000008', '990165876212030')

INSERT INTO transaction_detail VALUES
('74737003377098649023', 'PD00000002', 1),
('74737003377098649023', 'PD00000005', 5),
('65791929222796977052', 'PD00000003', 2),
('65791929222796977052', 'PD00000001', 1),
('65791929222796977052', 'PD00000006', 2),
('16849882781093276057', 'PD00000004', 1),
('16849882781093276057', 'PD00000001', 1),
('16849882781093276057', 'PD00000002', 1),
('17317006746830902339', 'PD00000006', 3),
('44549466125797899841', 'PD00000005', 2)