BEGIN;
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (201, 1980, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (202, 1981, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (203, 1981, '数学地质', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (204, 1981, '石油地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (205, 1981, '地质学', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (206, 1981, '地质矿产调查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (207, 1981, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (208, 1981, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (209, 1981, '放射性矿产地质', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (210, 1981, '石油物探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (211, 1981, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (212, 1981, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (213, 1982, '地质矿产调查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (214, 1982, '地质力学', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (215, 1982, '地质学', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (216, 1982, '石油地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (217, 1982, '地质仪器', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 地质仪器系', '四年', '地质仪器系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (218, 1982, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (219, 1982, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (220, 1982, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (221, 1982, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (222, 1982, '数学地质', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (223, 1982, '石油物探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (224, 1982, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (225, 1982, '放射性矿产地质', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (226, 1982, '数学师资班', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (227, 1982, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (228, 1983, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (229, 1983, '石油地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (230, 1983, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (231, 1983, '钻探工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (232, 1983, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (233, 1983, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (234, 1983, '地质矿产调查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (235, 1983, '地质力学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (236, 1983, '石油物探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (237, 1983, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (238, 1983, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (239, 1983, '放射性矿产地质', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (240, 1983, '数学地质', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (241, 1984, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (242, 1984, '石油地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (243, 1984, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (244, 1984, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (245, 1984, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (246, 1984, '钻探工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (247, 1984, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (248, 1984, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (249, 1984, '石油物探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (250, 1984, '地质力学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (251, 1984, '放射性矿产地质', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (252, 1984, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (253, 1985, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (254, 1985, '核电子学与核技术应用', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (255, 1985, '石油地质勘查', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油地质勘查系', '四年', '石油地质勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (256, 1985, '马列主义基础', '马克思主义学院', '成都地质学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (257, 1985, '铀矿地质勘查', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (258, 1985, '水文地质与工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (259, 1985, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (260, 1985, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (261, 1985, '应用数学', '数学科学学院', '成都地质学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (262, 1985, '地质力学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (263, 1985, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (264, 1985, '勘查地球物理', '地球物理学院', '成都地质学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (265, 1986, '马列主义基础', '马克思主义学院', '成都地质学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (266, 1986, '石油地质勘查', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油地质勘查系', '四年', '石油地质勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (267, 1986, '水文地质与工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (268, 1986, '铀矿地质勘查', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (269, 1986, '核电子学与核技术应用', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (270, 1986, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (271, 1986, '应用数学', '数学科学学院', '成都地质学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (272, 1986, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (273, 1986, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (274, 1986, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (275, 1986, '勘查地球物理', '地球物理学院', '成都地质学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (276, 1986, '地质力学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (277, 1987, '马列主义基础', '马克思主义学院', '成都地质学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (278, 1987, '石油地质勘查', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油地质勘查系', '四年', '石油地质勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (279, 1987, '水文地质与工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (280, 1987, '铀矿地质勘查', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (281, 1987, '核电子学与核技术应用', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (282, 1987, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (283, 1987, '应用数学', '数学科学学院', '成都地质学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (284, 1987, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (285, 1987, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (286, 1987, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (287, 1987, '地质力学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (288, 1987, '勘查地球物理', '地球物理学院', '成都地质学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (289, 1988, '地质力学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (290, 1988, '应用数学', '数学科学学院', '成都地质学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (291, 1988, '石油地质勘查', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油地质勘查系', '四年', '石油地质勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (292, 1988, '马克思主义基础', '马克思主义学院', '成都地质学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (293, 1988, '水文地质与工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (294, 1988, '铀矿地质勘查', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (295, 1988, '核电子学与核技术应用', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (296, 1988, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (297, 1988, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (298, 1988, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (299, 1988, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (300, 1988, '勘查地球物理', '地球物理学院', '成都地质学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
COMMIT;