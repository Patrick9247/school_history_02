BEGIN;
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1, 1956, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '矿产地质', '四年', '矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2, 1956, '地质测量及找矿', '地球与行星科学学院', '地质测量', '四年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (3, 1956, '水文地质及工程地质', '环境与土木工程学院', '水文地质', '四年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (4, 1956, '石油与天然气地质及勘探', '能源学院', '石油相关专业', '四年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (5, 1958, '地球物理勘探', '地球物理学院', '地球物理', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (6, 1958, '稀有元素地质勘探', '地球与行星科学学院', '稀有元素', '四年', '稀有分散元素与放射性元素地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (7, 1960, '探矿工程', '环境与土木工程学院', '探矿', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (8, 1960, '数学', '数学科学学院', '基础数学', '四年', '数学物理化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (9, 1964, '放射性地球物理勘探', '核技术与自动化工程学院', '核技术', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (10, 1965, '放射性矿产地质勘探', '核技术与自动化工程学院', '核技术', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (11, 1972, '石油及天然气地质', '能源学院', '石油', '三年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (12, 1962, '地球化学探矿', '地球与行星科学学院', '地球化学', '五年', '稀有分散元素与放射性元素地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (13, 2000, '人工智能', '信息科学与技术学院', 'AI', '四年', '人工智能系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (14, 1990, '软件工程', '信息科学与技术学院', '软件', '四年', '软件系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (15, 1980, '计算机科学与技术', '信息科学与技术学院', '计算机', '四年', '计算机系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (16, 2010, '数据科学与大数据技术', '信息科学与技术学院', '大数据', '四年', '数据科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (17, 1955, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '北京地质学院 · 石油系', '五年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (18, 1955, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '重庆大学 · 地质系', '五年', '地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (19, 1956, '水文地质及工程地质', '环境与土木工程学院', '成都地质勘探学院 · 水文地质及工程地质系', '四年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (20, 1956, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质勘探学院 · 地质测量及找矿系', '四年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (21, 1956, '地质测量及找矿', '地球与行星科学学院', '成都地质勘探学院 · 地质测量及找矿系', '四年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (22, 1956, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质勘探学院 · 石油与天然气地质及勘探系', '四年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (23, 1957, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质勘探学院 · 地质测量及找矿系', '四年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (24, 1957, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质勘探学院 · 石油与天然气地质及勘探系', '四年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (25, 1957, '水文地质及工程地质', '环境与土木工程学院', '成都地质勘探学院 · 水文地质及工程地质系', '四年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (26, 1957, '地质测量及找矿', '地球与行星科学学院', '成都地质勘探学院 · 地质测量及找矿系', '四年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (27, 1958, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质勘探学院 · 金属与非金属矿产地质及勘探系', '四年', '金属与非金属矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (28, 1958, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质勘探学院 · 石油与天然气地质及勘探系', '四年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (29, 1958, '地球物理勘探', '能源学院（页岩气现代产业学院）', '成都地质勘探学院 · 石油与天然气地质及勘探系', '四年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (30, 1958, '水文地质及工程地质', '环境与土木工程学院', '成都地质勘探学院 · 水文地质及工程地质系', '四年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (31, 1958, '地质测量及找矿', '地球与行星科学学院', '成都地质勘探学院 · 地质测量及找矿系', '四年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (32, 1959, '稀有分散元素地质勘探', '地球与行星科学学院', '成都地质学院 · 金属与非金属矿产地质及勘探系', '四年', '金属与非金属矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (33, 1959, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 金属与非金属矿产地质及勘探系', '四年', '金属与非金属矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (34, 1959, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '五年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (35, 1959, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油与天然气地质及勘探系', '五年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (36, 1959, '地球物理勘探', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油与天然气地质及勘探系', '四年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (37, 1959, '地质测量及找矿', '地球与行星科学学院', '成都地质学院 · 地质测量及找矿系', '四年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (38, 1960, '稀有元素地质勘探', '地球与行星科学学院', '成都地质学院 · 稀有分散元素与放射性元素地质及勘探系', '四年', '稀有分散元素与放射性元素地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (39, 1960, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '四年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (40, 1960, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (41, 1960, '放射性元素地质勘探', '地球与行星科学学院', '成都地质学院 · 稀有分散元素与放射性元素地质及勘探系', '四年', '稀有分散元素与放射性元素地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (42, 1960, '地球化学探矿', '地球与行星科学学院', '成都地质学院 · 稀有分散元素与放射性元素地质及勘探系', '四年', '稀有分散元素与放射性元素地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (43, 1960, '数学', '数学科学学院', '成都地质学院 · 数学物理化学系', '四年', '数学物理化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (44, 1960, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油与天然气地质及勘探系', '五年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (45, 1960, '矿物矿石分析检定', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (46, 1960, '化学', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 数学物理化学系', '四年', '数学物理化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (47, 1960, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '四年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (48, 1960, '物理', '物理学院', '成都地质学院 · 数学物理化学系', '四年', '数学物理化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (49, 1960, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (50, 1960, '地质测量及大地构造', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (51, 1960, '地层古生物', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (52, 1960, '勘探仪器设备及制造', '地球与行星科学学院', '成都地质学院 · 勘探机械与地质仪器设计及制造系', '四年', '勘探机械与地质仪器设计及制造系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (53, 1960, '物探仪器设计与制造', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (54, 1960, '勘探机械设计及制造', '地球与行星科学学院', '成都地质学院 · 勘探机械与地质仪器设计及制造系', '四年', '勘探机械与地质仪器设计及制造系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (55, 1960, '无线电设备设计及制造', '地球与行星科学学院', '成都地质学院 · 勘探机械与地质仪器设计及制造系', '五年', '勘探机械与地质仪器设计及制造系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (56, 1961, '稀有元素地质勘探', '地球与行星科学学院', '成都地质学院 · 稀有分散元素与放射性元素地质及勘探系', '四年', '稀有分散元素与放射性元素地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (57, 1961, '探矿工程', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (58, 1961, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油与天然气地质及勘探系', '五年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (59, 1961, '放射性元素地质勘探', '地球与行星科学学院', '成都地质学院 · 稀有分散元素与放射性元素地质及勘探系', '四年', '稀有分散元素与放射性元素地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (60, 1961, '矿产综合利用及加工技术', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '五年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (61, 1961, '地质测量及找矿', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (62, 1961, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (63, 1961, '地球化学探矿', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (64, 1961, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '五年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (65, 1961, '地层古生物', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '四年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (66, 1961, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '五年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (67, 1961, '放射性矿产地质', '核技术与自动化工程学院', '北京地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (68, 1961, '放射性地球物理勘探', '核技术与自动化工程学院', '北京地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (69, 1962, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '五年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (70, 1962, '稀有元素地质勘探', '地球与行星科学学院', '成都地质学院 · 稀有分散元素与放射性元素地质及勘探系', '五年', '稀有分散元素与放射性元素地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (71, 1962, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '五年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (72, 1962, '放射性地球物理勘探', '核技术与自动化工程学院', '北京地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (73, 1962, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油与天然气地质及勘探系', '五年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (74, 1962, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '五年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (75, 1962, '放射性矿产地质', '核技术与自动化工程学院', '北京地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (76, 1962, '地质测量及找矿', '地球与行星科学学院', '成都地质学院 · 找矿勘探系', '五年', '找矿勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (77, 1963, '稀有元素地质勘探', '地球与行星科学学院', '成都地质学院 · 矿产地质及勘探系', '五年', '矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (78, 1963, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 矿产地质及勘探系', '五年', '矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (79, 1963, '地质测量及找矿', '地球与行星科学学院', '成都地质学院 · 地质测量及找矿系', '五年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (80, 1963, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油与天然气地质及勘探系', '五年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (81, 1963, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '五年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (82, 1963, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '五年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (83, 1963, '放射性地球物理勘探', '核技术与自动化工程学院', '北京地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (84, 1963, '放射性矿产地质', '核技术与自动化工程学院', '北京地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (85, 1964, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '五年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (86, 1964, '放射性矿产地质', '核技术与自动化工程学院', '北京地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (87, 1964, '稀有元素地质勘探', '地球与行星科学学院', '成都地质学院 · 矿产地质及勘探系', '五年', '矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (88, 1964, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 矿产地质及勘探系', '五年', '矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (89, 1964, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油与天然气地质及勘探系', '五年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (90, 1964, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '五年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (91, 1964, '地质测量及找矿', '地球与行星科学学院', '成都地质学院 · 地质测量及找矿系', '五年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (92, 1964, '放射性地球物理勘探', '核技术与自动化工程学院', '北京地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (93, 1965, '金属与非金属矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 矿产地质及勘探系', '五年', '矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (94, 1965, '稀有元素地质勘探', '地球与行星科学学院', '成都地质学院 · 矿产地质及勘探系', '五年', '矿产地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (95, 1965, '石油与天然气地质及勘探', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油与天然气地质及勘探系', '五年', '石油与天然气地质及勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (96, 1965, '水文地质及工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质及工程地质系', '五年', '水文地质及工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (97, 1965, '地质测量及找矿', '地球与行星科学学院', '成都地质学院 · 地质测量及找矿系', '五年', '地质测量及找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (98, 1965, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '五年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (99, 1965, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (100, 1965, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
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
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (151, 1977, '石油及天然气地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (152, 1977, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (153, 1977, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (154, 1977, '金属与非金属地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (155, 1977, '石油及天然气地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (156, 1977, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (157, 1977, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (158, 1977, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (159, 1977, '数学地质', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (160, 1978, '矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (161, 1978, '地质力学', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (162, 1978, '区域地质调查及矿产普查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (163, 1978, '石油及天然气地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (164, 1978, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (165, 1978, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (166, 1978, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (167, 1978, '石油及天然气地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (168, 1978, '金属与非金属地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (169, 1978, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (170, 1978, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (171, 1978, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (172, 1978, '物理师资班', '地球物理学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (173, 1978, '数学师资班', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (174, 1978, '数学地质', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (175, 1978, '哲学师资班', '马克思主义学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (176, 1979, '数学地质', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (177, 1979, '地质力学', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (178, 1979, '矿产地质及勘探', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (179, 1979, '地质仪器', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 地质仪器系', '四年', '地质仪器系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (180, 1979, '石油及天然气地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (181, 1979, '区域地质调查及矿产普查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (182, 1979, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (183, 1979, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (184, 1979, '石油及天然气地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (185, 1979, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (186, 1979, '金属与非金属地球物理探矿', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (187, 1979, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (188, 1979, '化学师资班', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (189, 1979, '放射性矿产地质勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (190, 1979, '放射性地球物理勘探', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (191, 1980, '地球物理勘探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (192, 1980, '数学地质', '数学科学学院', '成都地质学院 · 七系', '四年', '七系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (193, 1980, '水文地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (194, 1980, '工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (195, 1980, '地质矿产调查', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (196, 1980, '地质学', '地球与行星科学学院', '成都地质学院 · 综合找矿系', '四年', '综合找矿系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (197, 1980, '石油地质', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (198, 1980, '石油物探', '地球物理学院', '成都地质学院 · 地球物理勘探系', '四年', '地球物理勘探系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (199, 1980, '放射性矿产地质', '核技术与自动化工程学院', '成都地质学院 · 三系', '四年', '三系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (200, 1980, '岩矿分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 二系', '四年', '二系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
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
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (301, 1989, '石油地质勘查', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油地质勘查系', '四年', '石油地质勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (302, 1989, '水文地质与工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (303, 1989, '应用数学', '数学科学学院', '成都地质学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (304, 1989, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (305, 1989, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (306, 1989, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (307, 1989, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (308, 1989, '勘查地球物理', '地球物理学院', '成都地质学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (309, 1990, '勘查地球物理', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (310, 1990, '地质矿产勘查', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (311, 1990, '应用数学', '数学科学学院', '成都地质学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (312, 1990, '马克思主义基础', '马克思主义学院', '成都地质学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (313, 1990, '石油地质勘查', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油地质勘查系', '四年', '石油地质勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (314, 1990, '水文地质与工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (315, 1990, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (316, 1990, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (317, 1990, '勘查地球物理', '地球物理学院', '成都地质学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (318, 1990, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (319, 1990, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (320, 1991, '马克思主义基础', '马克思主义学院', '成都地质学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (321, 1991, '石油地质勘查', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油地质勘查系', '四年', '石油地质勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (322, 1991, '水文地质与工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (323, 1991, '地质矿产勘查', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (324, 1991, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (325, 1991, '勘查地球物理', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (326, 1991, '勘查地球物理', '地球物理学院', '成都地质学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (327, 1991, '应用数学', '数学科学学院', '成都地质学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (328, 1991, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (329, 1991, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (330, 1991, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (331, 1992, '地质矿产勘查', '地球与行星科学学院', '成都地质学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (332, 1992, '马克思主义基础', '马克思主义学院', '成都地质学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (333, 1992, '地质矿产勘查', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (334, 1992, '石油地质勘查', '能源学院（页岩气现代产业学院）', '成都地质学院 · 石油地质勘查系', '四年', '石油地质勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (335, 1992, '地质学', '地球与行星科学学院', '成都地质学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (336, 1992, '水文地质与工程地质', '环境与土木工程学院', '成都地质学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (337, 1992, '探矿工程', '环境与土木工程学院', '成都地质学院 · 探矿工程系', '四年', '探矿工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (338, 1992, '勘查地球物理', '核技术与自动化工程学院', '成都地质学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (339, 1992, '应用数学', '数学科学学院', '成都地质学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (340, 1992, '勘查地球物理', '地球物理学院', '成都地质学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (341, 1992, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都地质学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (342, 1993, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 计算机工程系', '四年', '计算机工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (343, 1993, '应用电子技术', '机电工程学院', '成都理工学院 · 电子工程系', '四年', '电子工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (344, 1993, '石油与天然气地质勘查', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (345, 1993, '马克思主义基础', '马克思主义学院', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (346, 1993, '核技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (347, 1993, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (348, 1993, '应用地球物理', '地球物理学院', '成都理工学院 · 应用地球物理系', '四年', '应用地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (349, 1993, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (350, 1993, '应用数学', '数学科学学院', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (351, 1993, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 工程地质与岩土工程系', '四年', '工程地质与岩土工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (352, 1993, '建筑工程', '环境与土木工程学院', '成都理工学院 · 工程地质与岩土工程系', '四年', '工程地质与岩土工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (353, 1993, '地质矿产勘查', '地球与行星科学学院', '成都理工学院 · 地质矿产勘查系', '四年', '地质矿产勘查系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (354, 1993, '地质学', '地球与行星科学学院', '成都理工学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (355, 1993, '勘察工程', '环境与土木工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (356, 1994, '应用数学', '数学科学学院', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (357, 1994, '地质矿产勘查', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (358, 1994, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 计算机工程系', '四年', '计算机工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (359, 1994, '马克思主义基础', '马克思主义学院', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (360, 1994, '社会学', '文法学院（纪检监察学院）', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (361, 1994, '石油工程', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (362, 1994, '石油与天然气地质勘查', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (363, 1994, '应用电子技术', '机电工程学院', '成都理工学院 · 电子工程系', '四年', '电子工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (364, 1994, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (365, 1994, '水文与水资源利用', '环境与土木工程学院', '成都理工学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (366, 1994, '核技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (367, 1994, '建筑工程', '环境与土木工程学院', '成都理工学院 · 工程地质及建筑工程系', '四年', '工程地质及建筑工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (368, 1994, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (369, 1994, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (370, 1994, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 工程地质及建筑工程系', '四年', '工程地质及建筑工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (371, 1994, '英语', '外国语学院', '成都理工学院 · 外语系', '四年', '外语系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (372, 1994, '地质学', '地球与行星科学学院', '成都理工学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (373, 1994, '应用地球物理', '地球物理学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (374, 1994, '信息工程', '机电工程学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (375, 1994, '勘察工程', '环境与土木工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (376, 1995, '市场营销', '商学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (377, 1995, '社会学', '文法学院（纪检监察学院）', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (378, 1995, '勘察工程', '环境与土木工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (379, 1995, '应用数学', '数学科学学院', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (380, 1995, '应用电子技术', '机电工程学院', '成都理工学院 · 电子工程系', '四年', '电子工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (381, 1995, '电子仪器及测量技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (382, 1995, '地质矿产勘查', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (383, 1995, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 计算机工程系', '四年', '计算机工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (384, 1995, '企业管理', '管理科学学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (385, 1995, '马克思主义基础', '马克思主义学院', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (386, 1995, '石油与天然气地质勘查', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (387, 1995, '石油工程', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (388, 1995, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (389, 1995, '水文与水资源利用', '环境与土木工程学院', '成都理工学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (390, 1995, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 工程地质及建筑工程系', '四年', '工程地质及建筑工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (391, 1995, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (392, 1995, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (393, 1995, '化工工艺', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (394, 1995, '建筑工程', '环境与土木工程学院', '成都理工学院 · 工程地质及建筑工程系', '四年', '工程地质及建筑工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (395, 1995, '英语', '外国语学院', '成都理工学院 · 外语系', '四年', '外语系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (396, 1995, '地质学', '地球与行星科学学院', '成都理工学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (397, 1995, '应用地球物理', '地球物理学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (398, 1995, '信息工程', '机电工程学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (399, 1996, '市场营销', '商学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (400, 1996, '装潢技术设计', '传播科学与艺术学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (401, 1996, '应用数学', '数学科学学院', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (402, 1996, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (403, 1996, '地质矿产勘查', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (404, 1996, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 计算机工程系', '四年', '计算机工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (405, 1996, '企业管理', '管理科学学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (406, 1996, '马克思主义基础', '马克思主义学院', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (407, 1996, '化工工艺', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (408, 1996, '社会学', '文法学院（纪检监察学院）', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (409, 1996, '石油工程', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (410, 1996, '石油与天然气地质勘查', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (411, 1996, '电子仪器及测量技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (412, 1996, '核技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (413, 1996, '应用电子技术', '机电工程学院', '成都理工学院 · 电子工程系', '四年', '电子工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (414, 1996, '无机非金属材料', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 材料科学与工程系', '四年', '材料科学与工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (415, 1996, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 水文地质与工程地质系', '四年', '水文地质与工程地质系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (416, 1996, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (417, 1996, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 工程地质及建筑工程系', '四年', '工程地质及建筑工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (418, 1996, '建筑工程', '环境与土木工程学院', '成都理工学院 · 工程地质及建筑工程系', '四年', '工程地质及建筑工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (419, 1996, '英语', '外国语学院', '成都理工学院 · 外语系', '四年', '外语系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (420, 1996, '地质学', '地球与行星科学学院', '成都理工学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (421, 1996, '勘察工程', '环境与土木工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (422, 1996, '应用地球物理', '地球物理学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (423, 1996, '信息工程', '机电工程学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (424, 1997, '市场营销', '商学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (425, 1997, '应用数学', '数学科学学院', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (426, 1997, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (427, 1997, '化工工艺', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (428, 1997, '马克思主义基础', '马克思主义学院', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (429, 1997, '测量工程', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (430, 1997, '地质矿产勘查', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (431, 1997, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 计算机工程系', '四年', '计算机工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (432, 1997, '装潢技术设计', '传播科学与艺术学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (433, 1997, '石油与天然气地质勘查', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (434, 1997, '企业管理', '管理科学学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (435, 1997, '应用电子技术', '机电工程学院', '成都理工学院 · 电子工程系', '四年', '电子工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (436, 1997, '英语', '外国语学院', '成都理工学院 · 外语系', '四年', '外语系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (437, 1997, '社会学', '文法学院（纪检监察学院）', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (438, 1997, '石油工程', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (439, 1997, '建筑工程', '环境与土木工程学院', '成都理工学院 · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (440, 1997, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (441, 1997, '无机非金属材料', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 材料科学与工程系', '四年', '材料科学与工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (442, 1997, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (443, 1997, '电子仪器及测量技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (444, 1997, '核技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (445, 1997, '工业设计', '机电工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (446, 1997, '勘察工程', '环境与土木工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (447, 1997, '地质学', '地球与行星科学学院', '成都理工学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (448, 1997, '应用地球物理', '地球物理学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (449, 1997, '信息工程', '机电工程学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (450, 1998, '市场营销', '商学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (451, 1998, '经济法', '文法学院（纪检监察学院）', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (452, 1998, '测量工程', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (453, 1998, '地质矿产勘查', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (454, 1998, '应用数学', '数学科学学院', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (455, 1998, '无机非金属材料', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 材料科学与工程系', '四年', '材料科学与工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (456, 1998, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 计算机工程系', '四年', '计算机工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (457, 1998, '装潢技术设计', '传播科学与艺术学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (458, 1998, '马克思主义基础', '马克思主义学院', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (459, 1998, '企业管理', '管理科学学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (460, 1998, '社会学', '文法学院（纪检监察学院）', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (461, 1998, '石油工程', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (462, 1998, '石油与天然气地质勘查', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (463, 1998, '应用电子技术', '机电工程学院', '成都理工学院 · 电子工程系', '四年', '电子工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (464, 1998, '水文地质与工程地质', '环境与土木工程学院', '成都理工学院 · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (465, 1998, '核技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (466, 1998, '交通土建工程', '环境与土木工程学院', '成都理工学院 · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (467, 1998, '建筑工程', '环境与土木工程学院', '成都理工学院 · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (468, 1998, '电子仪器及测量技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (469, 1998, '计算机及应用', '计算机与网络安全学院（示范性软件学院）', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (470, 1998, '化工工艺', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (471, 1998, '工业分析', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (472, 1998, '英语', '外国语学院', '成都理工学院 · 外语系', '四年', '外语系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (473, 1998, '地质学', '地球与行星科学学院', '成都理工学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (474, 1998, '勘察工程', '环境与土木工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (475, 1998, '工业设计', '机电工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (476, 1998, '信息工程', '机电工程学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (477, 1998, '应用地球物理', '地球物理学院', '成都理工学院 · 信息工程与地球物理系', '四年', '信息工程与地球物理系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (478, 1999, '资源勘查工程', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (479, 1999, '测绘工程', '地球与行星科学学院', '成都理工学院 · 资源与经济系', '四年', '资源与经济系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (480, 1999, '艺术设计', '传播科学与艺术学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (481, 1999, '市场营销', '商学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (482, 1999, '社会学', '文法学院（纪检监察学院）', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (483, 1999, '工商管理', '管理科学学院', '成都理工学院 · 管理科学系', '四年', '管理科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (484, 1999, '勘查技术与工程', '地球物理学院', '成都理工学院 · 信息工程学院', '四年', '信息工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (485, 1999, '法学', '文法学院（纪检监察学院）', '成都理工学院 · 社会科学系', '四年', '社会科学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (486, 1999, '石油工程', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (487, 1999, '资源勘查工程', '能源学院（页岩气现代产业学院）', '成都理工学院 · 石油系', '四年', '石油系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (488, 1999, '环境工程', '生态环境学院', '成都理工学院 · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (489, 1999, '勘查技术与工程', '环境与土木工程学院', '成都理工学院 · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (490, 1999, '土木工程', '环境与土木工程学院', '成都理工学院 · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (491, 1999, '测控技术与仪器', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (492, 1999, '核工程与核技术', '核技术与自动化工程学院', '成都理工学院 · 核原料与核技术工程系', '四年', '核原料与核技术工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (493, 1999, '无机非金属材料工程', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 材料科学与工程系', '四年', '材料科学与工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (494, 1999, '地球物理学', '地球物理学院', '成都理工学院 · 信息工程学院', '四年', '信息工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (495, 1999, '数学与应用数学', '数学科学学院', '成都理工学院 · 应用数学系', '四年', '应用数学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (496, 1999, '化学工程与工艺', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工学院 · 应用化学系', '四年', '应用化学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (497, 1999, '地质学', '地球与行星科学学院', '成都理工学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (498, 1999, '英语', '外国语学院', '成都理工学院 · 外语系', '四年', '外语系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (499, 1999, '资源环境与城乡规划管理', '地理与规划学院', '成都理工学院 · 地质学系', '四年', '地质学系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (500, 1999, '机械设计制造及其自动化', '机电工程学院', '成都理工学院 · 勘察与机电工程系', '四年', '勘察与机电工程系', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
COMMIT;
