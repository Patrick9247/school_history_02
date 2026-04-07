BEGIN;
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (101, 1972, '综合找矿', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (102, 1972, '石油及天然气地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '三年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (103, 1972, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (104, 1972, '金属与非金属地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '三年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (105, 1972, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '三年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (106, 1972, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '三年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (107, 1972, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (108, 1973, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '三年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (109, 1973, '综合找矿', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (110, 1973, '石油及天然气地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '三年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (111, 1973, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (112, 1973, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (113, 1973, '金属与非金属地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '三年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (114, 1973, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '三年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (115, 1974, '探矿工程', '环境与土木工程学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (116, 1974, '矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (117, 1974, '区域地质调查及矿产普查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (118, 1974, '金属与非金属地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '三年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (119, 1974, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '三年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (120, 1974, '石油及天然气地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '三年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (121, 1974, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (122, 1974, '石油及天然气地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '三年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (123, 1974, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (124, 1974, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '三年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (125, 1975, '矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (126, 1975, '探矿工程', '环境与土木工程学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (127, 1975, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '三年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (128, 1975, '区域地质调查及矿产普查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (129, 1975, '石油及天然气地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '三年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (130, 1975, '石油及天然气地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '三年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (131, 1975, '金属与非金属地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '三年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (132, 1975, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '三年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (133, 1975, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (134, 1975, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (135, 1976, '探矿工程', '环境与土木工程学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (136, 1976, '地质力学', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (137, 1976, '矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (138, 1976, '石油及天然气地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '三年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (139, 1976, '区域地质调查及矿产普查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '三年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (140, 1976, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '三年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (141, 1976, '石油及天然气地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '三年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (142, 1976, '金属与非金属地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '三年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (143, 1976, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '三年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (144, 1976, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (145, 1976, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '三年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (146, 1976, '数学地质', '数学科学学院', '成都地质学院 · 七系', '三年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (147, 1977, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (148, 1977, '矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (149, 1977, '地质力学', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (150, 1977, '区域地质调查及矿产普查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
COMMIT;
