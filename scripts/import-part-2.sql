BEGIN;
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
COMMIT;
