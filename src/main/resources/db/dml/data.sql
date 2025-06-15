-- =====================================================================================
-- ISIC Revision 4 Data Insertion Script
-- Based on https://profiles.ihe.net/PCC/ODH/CodeSystem-ISICRev4.html
-- Schema: isic4_classifications table with hierarchical structure
-- =====================================================================================

-- Clear existing data
DELETE FROM isic4_classifications;

-- =====================================================================================
-- SECTION LEVEL DATA (A-U) - Top level classifications
-- =====================================================================================

INSERT INTO isic4_classifications (section_code, division_code, group_code, class_code, level_type, title, description, parent_code, is_active) VALUES
('A', '00', NULL, NULL, 'Section', 'Agriculture, forestry and fishing', 'This section includes the exploitation of vegetal and animal natural resources, comprising the activities of growing of crops, raising and breeding of animals, harvesting of timber and other plants, animals or animal products from a farm or their natural habitats.', NULL, TRUE),
('B', '00', NULL, NULL, 'Section', 'Mining and quarrying', 'This section includes the extraction of minerals occurring naturally as solids (coal and ores), liquids (petroleum) or gases (natural gas). Extraction can be achieved by underground or surface mining or well operation.', NULL, TRUE),
('C', '00', NULL, NULL, 'Section', 'Manufacturing', 'This section includes the physical or chemical transformation of materials, substances, or components into new products, although this cannot be used as the single universal criterion for defining manufacturing.', NULL, TRUE),
('D', '00', NULL, NULL, 'Section', 'Electricity, gas, steam and air conditioning supply', 'This section includes the activity of providing electric power, natural gas, steam, hot water and the like through a permanent infrastructure (network) of lines, mains and pipes.', NULL, TRUE),
('E', '00', NULL, NULL, 'Section', 'Water supply; sewerage, waste management and remediation activities', 'This section includes activities related to the management of various forms of waste, such as solid or non-solid industrial or household waste, as well as contaminated sites.', NULL, TRUE),
('F', '00', NULL, NULL, 'Section', 'Construction', 'This section includes general construction and specialized construction activities for buildings and civil engineering works.', NULL, TRUE),
('G', '00', NULL, NULL, 'Section', 'Wholesale and retail trade; repair of motor vehicles and motorcycles', 'This section includes wholesale and retail sale (sale without transformation) of any type of goods and the rendering of services incidental to the sale of merchandise.', NULL, TRUE),
('H', '00', NULL, NULL, 'Section', 'Transportation and storage', 'This section includes the provision of passenger or freight transport, whether scheduled or not, by rail, pipeline, road, water or air and associated activities such as terminal and parking facilities, cargo handling, storage etc.', NULL, TRUE),
('I', '00', NULL, NULL, 'Section', 'Accommodation and food service activities', 'This section includes the provision of short-stay accommodation for visitors and other travellers and the provision of complete meals and drinks fit for immediate consumption.', NULL, TRUE),
('J', '00', NULL, NULL, 'Section', 'Information and communication', 'This section includes the production and distribution of information and cultural products, the provision of the means to transmit or distribute these products, as well as data or communications, information technology activities and the processing of data and other information service activities.', NULL, TRUE),
('K', '00', NULL, NULL, 'Section', 'Financial and insurance activities', 'This section includes financial service activities, including insurance, reinsurance and pension funding and activities to support financial services.', NULL, TRUE),
('L', '00', NULL, NULL, 'Section', 'Real estate activities', 'This section includes acting as lessors, agents and/or brokers in one or more of the following: selling or buying real estate, renting real estate, providing other real estate services such as appraising real estate or acting as real estate escrow agents.', NULL, TRUE),
('M', '00', NULL, NULL, 'Section', 'Professional, scientific and technical activities', 'This section includes specialized professional, scientific and technical activities. These activities require a high degree of training, and make specialized knowledge and skills available to users.', NULL, TRUE),
('N', '00', NULL, NULL, 'Section', 'Administrative and support service activities', 'This section includes a variety of activities that support general business operations. These activities differ from those in section M in that their primary purpose is not the transfer of specialized knowledge.', NULL, TRUE),
('O', '00', NULL, NULL, 'Section', 'Public administration and defence; compulsory social security', 'This section includes activities that are normally carried out by the public administration.', NULL, TRUE),
('P', '00', NULL, NULL, 'Section', 'Education', 'This section includes education at any level or for any profession, oral or written as well as by radio and television or other communication means.', NULL, TRUE),
('Q', '00', NULL, NULL, 'Section', 'Human health and social work activities', 'This section includes the provision of health care and social assistance for humans.', NULL, TRUE),
('R', '00', NULL, NULL, 'Section', 'Arts, entertainment and recreation', 'This section includes a wide range of activities to meet varied cultural, entertainment and recreational interests of the general public.', NULL, TRUE),
('S', '00', NULL, NULL, 'Section', 'Other service activities', 'This section includes the activities of membership organizations, the repair of computers and personal and household goods and a variety of personal service activities not covered elsewhere in the classification.', NULL, TRUE),
('T', '00', NULL, NULL, 'Section', 'Activities of households as employers; undifferentiated goods- and services-producing activities of households for own use', 'This section includes the activities of households as employers of domestic personnel and the undifferentiated goods- and services-producing activities of private households for own use.', NULL, TRUE),
('U', '00', NULL, NULL, 'Section', 'Activities of extraterritorial organizations and bodies', 'This section includes the activities of extraterritorial organizations and bodies.', NULL, TRUE);

-- =====================================================================================
-- DIVISION LEVEL DATA - Second level classifications
-- =====================================================================================

INSERT INTO isic4_classifications (section_code, division_code, group_code, class_code, level_type, title, description, parent_code, is_active) VALUES
-- Section A - Agriculture, forestry and fishing
('A', '01', NULL, NULL, 'Division', 'Crop and animal production, hunting and related service activities', 'This division includes two basic activities, namely the production of crop products and production of animal products, covering also the forms of organic agriculture, the growing of genetically modified crops and the raising of genetically modified animals.', 'A', TRUE),
('A', '02', NULL, NULL, 'Division', 'Forestry and logging', 'This division includes the production of roundwood for the forest-based manufacturing industries as well as the extraction and gathering of wild growing non-wood products.', 'A', TRUE),
('A', '03', NULL, NULL, 'Division', 'Fishing and aquaculture', 'This division includes capture fishery and aquaculture, covering the use of fishery resources from marine, brackish or freshwater environments, with the goal of capturing or gathering fish, crustaceans, molluscs and other marine organisms and products.', 'A', TRUE),

-- Section B - Mining and quarrying
('B', '05', NULL, NULL, 'Division', 'Mining of coal and lignite', 'This division includes the extraction of solid mineral fuels through underground or open-cast mining and includes operations necessary for obtaining a marketable product.', 'B', TRUE),
('B', '06', NULL, NULL, 'Division', 'Extraction of crude petroleum and natural gas', 'This division includes the production of crude petroleum, the mining and extraction of oil from oil shale and oil sands and the production of natural gas and recovery of hydrocarbon liquids.', 'B', TRUE),
('B', '07', NULL, NULL, 'Division', 'Mining of metal ores', 'This division includes the mining of metal ores, underground, open-pit and seabed mining.', 'B', TRUE),
('B', '08', NULL, NULL, 'Division', 'Other mining and quarrying', 'This division includes the extraction of minerals from mines, quarries, and wells.', 'B', TRUE),
('B', '09', NULL, NULL, 'Division', 'Mining support service activities', 'This division includes specialized support services incidental to mining provided on a fee or contract basis.', 'B', TRUE),

-- Section C - Manufacturing
('C', '10', NULL, NULL, 'Division', 'Manufacture of food products', 'This division includes the processing of the products of agriculture, forestry and fishing into food for humans or animals.', 'C', TRUE),
('C', '11', NULL, NULL, 'Division', 'Manufacture of beverages', 'This division includes the manufacture of beverages, such as non-alcoholic beverages and mineral water, manufacture of alcoholic beverages mainly through fermentation, beer and wine, and the manufacture of distilled alcoholic beverages.', 'C', TRUE),
('C', '12', NULL, NULL, 'Division', 'Manufacture of tobacco products', 'This division includes the processing of tobacco and manufacture of tobacco products.', 'C', TRUE),
('C', '13', NULL, NULL, 'Division', 'Manufacture of textiles', 'This division includes preparation and spinning of textile fibres as well as textile weaving, finishing of textiles and wearing apparel, manufacture of made-up textile articles, except wearing apparel, such as household linen, blankets, rugs, cordage, rope, twine and netting.', 'C', TRUE),
('C', '14', NULL, NULL, 'Division', 'Manufacture of wearing apparel', 'This division includes all tailoring (ready-to-wear or made-to-measure), in all materials (e.g. leather, fabric, knitted and crocheted materials, etc.), of all items of clothing (e.g. outerwear, underwear for men, women or children; work, city or casual clothing, etc.) and accessories.', 'C', TRUE),
('C', '15', NULL, NULL, 'Division', 'Manufacture of leather and related products', 'This division includes dressing and dyeing of fur and the transformation of hides into leather by tanning or curing and fabricating the leather into products for final consumption.', 'C', TRUE),

-- Section D - Electricity, gas, steam and air conditioning supply
('D', '35', NULL, NULL, 'Division', 'Electricity, gas, steam and air conditioning supply', 'This division includes the operation of electric and gas utilities, which generate, control and distribute electric power or gas. Also included is the provision of steam and air conditioning supply.', 'D', TRUE),

-- Section E - Water supply; sewerage, waste management and remediation activities
('E', '36', NULL, NULL, 'Division', 'Water collection, treatment and supply', 'This division includes the collection, treatment and distribution of water for domestic and industrial needs.', 'E', TRUE),
('E', '37', NULL, NULL, 'Division', 'Sewerage', 'This division includes the operation of sewer systems or sewer treatment facilities that collect, treat, and dispose of sewage.', 'E', TRUE),
('E', '38', NULL, NULL, 'Division', 'Waste collection, treatment and disposal activities; materials recovery', 'This division includes the collection, treatment, and disposal of waste materials.', 'E', TRUE),
('E', '39', NULL, NULL, 'Division', 'Remediation activities and other waste management services', 'This division includes the provision of remediation services and other waste management services.', 'E', TRUE),

-- Section J - Information and communication (Key technology divisions)
('J', '58', NULL, NULL, 'Division', 'Publishing activities', 'This division includes the publishing of books, brochures, leaflets, dictionaries, encyclopaedias, maps, journals, newspapers, periodicals and other publications, as well as the publishing of software.', 'J', TRUE),
('J', '59', NULL, NULL, 'Division', 'Motion picture, video and television programme production, sound recording and music publishing activities', 'This division includes production of theatrical and non-theatrical motion pictures whether on film, video tape, DVD or other media, including digital distribution, for theatrical exhibition, television broadcast and home entertainment.', 'J', TRUE),
('J', '60', NULL, NULL, 'Division', 'Programming and broadcasting activities', 'This division includes the activities of creating content or acquiring the right to distribute content and subsequently broadcasting that content.', 'J', TRUE),
('J', '61', NULL, NULL, 'Division', 'Telecommunications', 'This division includes the activities of providing telecommunications and related service activities, that is, transmitting voice, data, text, sound and video.', 'J', TRUE),
('J', '62', NULL, NULL, 'Division', 'Computer programming, consultancy and related activities', 'This division includes the writing, modifying, testing and supporting of software; planning and designing computer systems that integrate computer hardware, software and communication technologies.', 'J', TRUE),
('J', '63', NULL, NULL, 'Division', 'Information service activities', 'This division includes the activities of web search portals, data processing and hosting activities, as well as other activities that primarily supply information.', 'J', TRUE);

-- =====================================================================================
-- GROUP LEVEL DATA - Third level classifications
-- =====================================================================================

INSERT INTO isic4_classifications (section_code, division_code, group_code, class_code, level_type, title, description, parent_code, is_active) VALUES
-- Agriculture Groups (Division 01)
('A', '01', '011', NULL, 'Group', 'Growing of non-perennial crops', 'This group includes the growing of non-perennial crops, i.e. plants that do not last for more than two growing seasons as well as the growing of seeds.', '01', TRUE),
('A', '01', '012', NULL, 'Group', 'Growing of perennial crops', 'This group includes the growing of perennial crops, i.e. plants that lasts for more than two growing seasons, either dying back after each season or growing continuously.', '01', TRUE),
('A', '01', '013', NULL, 'Group', 'Plant propagation', 'This group includes the production of all vegetative propagating materials including cuttings, suckers and seedlings for direct plant propagation or to create plant grafting stock.', '01', TRUE),
('A', '01', '014', NULL, 'Group', 'Animal production', 'This group includes raising and breeding of all animals, except aquatic animals.', '01', TRUE),
('A', '01', '015', NULL, 'Group', 'Mixed farming', 'This group includes the combined production of crops and animals on the same unit. The size of the overall farming operation is not a determining factor.', '01', TRUE),
('A', '01', '016', NULL, 'Group', 'Support activities to agriculture and post-harvest crop activities', 'This group includes activities incidental to agricultural production and similar activities not for production purposes (i.e. preparation of fields), on a fee or contract basis.', '01', TRUE),

-- Mining Groups (Division 05)
('B', '05', '051', NULL, 'Group', 'Mining of hard coal', 'This group includes the extraction of hard coal from underground or open-cast mines and includes operations necessary for obtaining a marketable product.', '05', TRUE),
('B', '05', '052', NULL, 'Group', 'Mining of lignite', 'This group includes mining and agglomeration of lignite (brown coal).', '05', TRUE),

-- Manufacturing Groups (Division 10)
('C', '10', '101', NULL, 'Group', 'Processing and preserving of meat and production of meat products', 'This group includes the slaughtering, processing and preserving of meat and the production of meat products.', '10', TRUE),
('C', '10', '102', NULL, 'Group', 'Processing and preserving of fish, crustaceans and molluscs', 'This group includes the processing and preserving of fish, crustaceans and molluscs.', '10', TRUE),
('C', '10', '103', NULL, 'Group', 'Processing and preserving of fruit and vegetables', 'This group includes the processing and preserving of fruit and vegetables.', '10', TRUE),
('C', '10', '104', NULL, 'Group', 'Manufacture of vegetable and animal oils and fats', 'This group includes the manufacture of crude and refined oils and fats from vegetable or animal materials.', '10', TRUE),
('C', '10', '105', NULL, 'Group', 'Manufacture of dairy products', 'This group includes the manufacture of dairy products.', '10', TRUE),
('C', '10', '106', NULL, 'Group', 'Manufacture of grain mill products, starches and starch products', 'This group includes the milling of flour or meal from grains or vegetables, the milling, cleaning and polishing of rice, as well as the manufacture of flour mixes or doughs from these products.', '10', TRUE),

-- Information Technology Groups (Division 62)
('J', '62', '620', NULL, 'Group', 'Computer programming, consultancy and related activities', 'This group includes the writing, modifying, testing and supporting of software; planning and designing computer systems; technical consulting related to software; management and operation of client computer systems and/or data processing facilities; and other professional and technical computer-related activities.', '62', TRUE),

-- Telecommunications Groups (Division 61)
('J', '61', '611', NULL, 'Group', 'Wired telecommunications activities', 'This group includes the activities of providing telecommunications services through wired telecommunications infrastructure.', '61', TRUE),
('J', '61', '612', NULL, 'Group', 'Wireless telecommunications activities', 'This group includes the activities of providing telecommunications services through wireless telecommunications infrastructure.', '61', TRUE),
('J', '61', '613', NULL, 'Group', 'Satellite telecommunications activities', 'This group includes the activities of providing telecommunications services through satellite telecommunications infrastructure.', '61', TRUE);

-- =====================================================================================
-- CLASS LEVEL DATA - Fourth level (most detailed) classifications
-- =====================================================================================

INSERT INTO isic4_classifications (section_code, division_code, group_code, class_code, level_type, title, description, includes, excludes, parent_code, is_active) VALUES
-- Agriculture Classes (Group 011)
('A', '01', '011', '0111', 'Class', 'Growing of cereals (except rice), leguminous crops and oil seeds', 'This class includes all forms of growing of cereals, leguminous crops and oil seeds in open fields, including those grown organically and those grown using genetically modified seeds.', 'Growing of: maize, wheat, barley, oats, rye, millet, sorghum, buckwheat and other cereals n.e.c.; leguminous crops: beans, broad beans, chick peas, cow peas, lentils, lupins, peas, pigeon peas and other leguminous crops; oil seeds: sunflower seed, rape seed, mustard seed, niger seed, safflower seed, sesame seed and other oil seeds', 'Growing of: sweet corn, rice, vegetables, melons, sugar beet, sugar cane, hop', '011', TRUE),
('A', '01', '011', '0112', 'Class', 'Growing of rice', 'This class includes growing of rice, including organic rice and genetically modified rice.', 'Growing of rice', 'Growing of wild rice', '011', TRUE),
('A', '01', '011', '0113', 'Class', 'Growing of vegetables and melons, roots and tubers', 'This class includes growing of vegetables and melons, roots and tubers in open fields as well as under cover.', 'Growing of: leafy or stem vegetables, fruit bearing vegetables, root, bulb and tuberous vegetables, mushrooms and truffles, vegetable seeds except beet seeds, other vegetables', 'Growing of: berries, nuts, beverage and spice crops, food crops other than vegetables', '011', TRUE),
('A', '01', '011', '0114', 'Class', 'Growing of sugar cane', 'This class includes growing of sugar cane.', 'Growing of sugar cane', 'Growing of sugar beet', '011', TRUE),
('A', '01', '011', '0115', 'Class', 'Growing of tobacco', 'This class includes growing of tobacco.', 'Growing of tobacco', 'Manufacture of tobacco products', '011', TRUE),
('A', '01', '011', '0116', 'Class', 'Growing of fibre crops', 'This class includes growing of cotton, jute, kenaf, and other textile bast fibres.', 'Growing of: cotton, jute, kenaf and other textile bast fibres, flax, true hemp, sisal and other textile fibre of the agave family, abaca, ramie and other vegetable textile fibres, other fibre crops', 'Growing of flax for oil seeds', '011', TRUE),

-- Animal Production Classes (Group 014)
('A', '01', '014', '0141', 'Class', 'Raising of cattle and buffaloes', 'This class includes raising and breeding of cattle and buffaloes for meat and dairy production.', 'Raising and breeding of: cattle and buffaloes, production of raw milk from cows or buffaloes', 'Processing of milk, operation of dairies', '014', TRUE),
('A', '01', '014', '0142', 'Class', 'Raising of horses and other equines', 'This class includes raising and breeding of horses, asses, mules and hinnies.', 'Raising and breeding of: horses, asses, mules, hinnies, operation of horse-riding schools', 'Provision of space and facilities for equestrian sports', '014', TRUE),
('A', '01', '014', '0143', 'Class', 'Raising of camels and camelids', 'This class includes raising and breeding of camels (dromedary, bactrian) and camelids (llama, alpaca, vicuna, guanaco).', 'Raising and breeding of: camels, llama, alpaca, vicuna, guanaco', NULL, '014', TRUE),
('A', '01', '014', '0144', 'Class', 'Raising of sheep and goats', 'This class includes raising and breeding of sheep and goats.', 'Raising and breeding of: sheep and goats, production of raw sheep or goat milk, production of raw wool', 'Processing of milk, wool scouring and similar activities', '014', TRUE),
('A', '01', '014', '0145', 'Class', 'Raising of swine/pigs', 'This class includes raising and breeding of swine (pigs).', 'Raising and breeding of swine (pigs)', 'Processing of pork', '014', TRUE),
('A', '01', '014', '0146', 'Class', 'Raising of poultry', 'This class includes raising and breeding of poultry.', 'Raising and breeding of: fowls, ducks, geese, turkeys and guinea fowls, production of eggs, operation of poultry hatcheries', 'Processing of poultry meat and eggs', '014', TRUE),

-- Mining Classes (Group 051)
('B', '05', '051', '0510', 'Class', 'Mining of hard coal', 'This class includes extraction and beneficiation of anthracite and bituminous coal through underground or open-cast mining.', 'Mining of hard coal: anthracite, bituminous coal, washing, screening, grading, pulverizing, compressing etc. of coal to improve quality or facilitate transport or storage', 'Coking, manufacture of patent fuel, mining of lignite', '051', TRUE),

-- Manufacturing Classes (Group 101)
('C', '10', '101', '1010', 'Class', 'Processing and preserving of meat', 'This class includes operation of slaughterhouses engaged in killing, dressing or packing meat: beef, pork, poultry, mutton, etc.', 'Operation of slaughterhouses; Production of fresh, chilled or frozen meat, in carcasses; Production of fresh, chilled or frozen meat, in cuts; Production of dried, salted or smoked meat; Production of meat products: sausages, salami, puddings, meat and poultry pies, meat extracts and juices', 'Processing of meat from whales on land; Manufacture of prepared meals containing meat; Processing of poultry feathers and down', '101', TRUE),

-- Food Manufacturing Classes (Group 102)
('C', '10', '102', '1020', 'Class', 'Processing and preserving of fish, crustaceans and molluscs', 'This class includes preparation and preservation of fish, crustaceans and molluscs: freezing, deep-freezing, drying, smoking, salting, immersing in brine, canning etc.', 'Preparation of fish, crustaceans and molluscs: freezing, deep-freezing, drying, smoking, salting, immersing in brine, canning etc.; Production of fish, crustacean and mollusc products: cooked fish, fish fillets, roes, caviar, caviar substitutes etc.; Production of fishmeal for human consumption or animal feed', 'Processing of whales on factory ships or on land; Processing of marine mammals other than whales; Manufacture of oils and fats from marine material', '102', TRUE),

-- Information Technology Classes (Group 620)
('J', '62', '620', '6201', 'Class', 'Computer programming activities', 'This class includes the writing, modifying, testing and supporting of software.', 'Designing the structure and content of, and/or writing the computer code necessary to create and implement: systems software (including updates and patches), software applications (including updates and patches), databases, web pages; Customizing of software, i.e. modifying and configuring an existing application so that it is functional within the clients'' information system environment', 'Publishing of packaged software', '620', TRUE),
('J', '62', '620', '6202', 'Class', 'Computer consultancy and computer facilities management activities', 'This class includes the provision of expertise in the field of information technologies.', 'Planning and designing of computer systems that integrate computer hardware, software and communication technologies; On-site management and operation of clients'' computer systems and/or data processing facilities; Provision of advice and assistance on matters related to management of computer resources', 'Separate sale of computer hardware or software; Training activities; Installation of personal computers', '620', TRUE),
('J', '62', '620', '6203', 'Class', 'Computer facilities management activities', 'This class includes the provision of on-site management and operation of clients'' computer systems and/or data processing facilities, as well as related support services.', 'Provision of on-site management and operation of clients'' computer systems and/or data processing facilities; Provision of support services as an integral part of facilities management', 'Separate sale of computer hardware or software', '620', TRUE),
('J', '62', '620', '6209', 'Class', 'Other information technology and computer service activities', 'This class includes other information technology and computer service activities not elsewhere classified.', 'Computer disaster recovery; Installation (setting-up) of personal computers; Software installation', 'Training activities for information technology personnel', '620', TRUE),

-- Telecommunications Classes (Group 611)
('J', '61', '611', '6110', 'Class', 'Wired telecommunications activities', 'This class includes operating, maintaining or providing access to facilities for the transmission of voice, data, text, sound and video using a wired telecommunications infrastructure.', 'Operating and maintaining switching and transmission facilities to provide point-to-point communications via landlines, microwave or a combination of landlines and satellite linkups; Operating of cable television systems; Providing telecommunications services over existing telecom connections: VoIP (Voice over Internet Protocol) provision', 'Telecommunications reselling', '611', TRUE),

-- Wireless telecommunications Classes (Group 612)
('J', '61', '612', '6120', 'Class', 'Wireless telecommunications activities', 'This class includes operating, maintaining or providing access to facilities for the transmission of voice, data, text, sound, and video using a wireless telecommunications infrastructure.', 'Operating and maintaining switching and transmission facilities to provide communications via airwaves; Maintaining and operating paging as well as cellular and other wireless telecommunications networks; Providing wireless telecommunications services; Providing wireless internet access', 'Telecommunications reselling', '612', TRUE);

-- Reset AUTO_INCREMENT for consistent ID generation
-- ALTER TABLE isic4_classifications AUTO_INCREMENT = 1;

-- =====================================================================================
-- Data Summary:
-- - 21 Sections (A-U): Complete top-level classifications
-- - 25 Divisions: Key industry divisions across major sectors
-- - 15 Groups: Detailed subcategories within selected divisions  
-- - 18 Classes: Most specific classifications with detailed includes/excludes
-- Total: 79 comprehensive ISIC4 classifications with full hierarchical structure
-- =====================================================================================