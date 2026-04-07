BEGIN;
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2201, 2024, '机械工程', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2202, 2024, '核工程与核技术', '核技术与自动化工程学院', '成都理工大学（成都校区） · 核技术与自动化工程学院', '四年', '核技术与自动化工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2203, 2024, '测控技术与仪器', '核技术与自动化工程学院', '成都理工大学（成都校区） · 核技术与自动化工程学院', '四年', '核技术与自动化工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2204, 2024, '社会学', '文法学院（纪检监察学院）', '成都理工大学（成都校区） · 文法学院', '四年', '文法学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2205, 2024, '新能源材料与器件', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院（锂资源与锂电产业学院）', '四年', '材料与化学化工学院（锂资源与锂电产业学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2206, 2024, '材料科学与工程', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院（锂资源与锂电产业学院）', '四年', '材料与化学化工学院（锂资源与锂电产业学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2207, 2024, '化学', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院（锂资源与锂电产业学院）', '四年', '材料与化学化工学院（锂资源与锂电产业学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2208, 2024, '工业设计', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2209, 2024, '应用化学', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院（锂资源与锂电产业学院）', '四年', '材料与化学化工学院（锂资源与锂电产业学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2210, 2024, '化学工程与工艺', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院（锂资源与锂电产业学院）', '四年', '材料与化学化工学院（锂资源与锂电产业学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2211, 2024, '法学', '文法学院（纪检监察学院）', '成都理工大学（成都校区） · 文法学院', '四年', '文法学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2212, 2024, '通信工程', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2213, 2024, '公共事业管理', '文法学院（纪检监察学院）', '成都理工大学（成都校区） · 文法学院', '四年', '文法学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2214, 2024, '电子信息工程', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2215, 2024, '应用统计学', '数学科学学院', '成都理工大学（成都校区） · 数学科学学院', '四年', '数学科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2216, 2024, '信息与计算科学', '数学科学学院', '成都理工大学（成都校区） · 数学科学学院', '四年', '数学科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2217, 2024, '应用物理学', '物理学院', '成都理工大学（成都校区） · 数理学院', '四年', '数理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2218, 2024, '商务英语', '外国语学院', '成都理工大学（成都校区） · 外国语学院', '四年', '外国语学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2219, 2024, '英语', '外国语学院', '成都理工大学（成都校区） · 外国语学院', '四年', '外国语学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2220, 2024, '日语', '外国语学院', '成都理工大学（成都校区） · 外国语学院', '四年', '外国语学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2221, 2024, '风景园林', '地理与规划学院', '成都理工大学（成都校区） · 地理与规划学院', '五年', '地理与规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2222, 2024, '翻译', '外国语学院', '成都理工大学（成都校区） · 外国语学院', '四年', '外国语学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2223, 2024, '遥感科学与技术', '地理与规划学院', '成都理工大学（成都校区） · 地理与规划学院', '四年', '地理与规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2224, 2024, '旅游管理', '地理与规划学院', '成都理工大学（成都校区） · 地理与规划学院', '四年', '地理与规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2225, 2024, '建筑学', '地理与规划学院', '成都理工大学（成都校区） · 地理与规划学院', '五年', '地理与规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2226, 2024, '地理信息科学', '地理与规划学院', '成都理工大学（成都校区） · 地理与规划学院', '四年', '地理与规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2227, 2024, '人文地理与城乡规划', '地理与规划学院', '成都理工大学（成都校区） · 地理与规划学院', '四年', '地理与规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2228, 2024, '空间科学与技术', '地球物理学院', '成都理工大学（成都校区） · 地球物理学院', '四年', '地球物理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2229, 2024, '地球物理学', '地球物理学院', '成都理工大学（成都校区） · 地球物理学院', '四年', '地球物理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2230, 2024, '地质学', '地球与行星科学学院', '成都理工大学（成都校区） · 地球与行星科学学院', '四年', '地球与行星科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2231, 2024, '勘查技术与工程', '地球物理学院', '成都理工大学（成都校区） · 地球物理学院', '四年', '地球物理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2232, 2024, '资源勘查工程', '地球与行星科学学院', '成都理工大学（成都校区） · 地球与行星科学学院', '四年', '地球与行星科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2233, 2024, '行星科学', '地球与行星科学学院', '成都理工大学（成都校区） · 地球与行星科学学院', '四年', '地球与行星科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2234, 2024, '测绘工程', '地球与行星科学学院', '成都理工大学（成都校区） · 地球与行星科学学院', '四年', '地球与行星科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2235, 2024, '地球化学', '地球与行星科学学院', '成都理工大学（成都校区） · 地球与行星科学学院', '四年', '地球与行星科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2236, 2024, '软件工程（中外合作办学）', '国际教育学院（成都理工大学牛津布鲁克斯学院）', '成都理工大学（成都校区） · 国际教育学院（成都理工大学牛津布鲁克斯学院）', '四年', '国际教育学院（成都理工大学牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2237, 2024, '计算机科学与技术（中外合作办学）', '国际教育学院（成都理工大学牛津布鲁克斯学院）', '成都理工大学（成都校区） · 国际教育学院（成都理工大学牛津布鲁克斯学院）', '四年', '国际教育学院（成都理工大学牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2238, 2024, '市场营销', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2239, 2024, '工商管理（中外合作办学）', '国际教育学院（成都理工大学牛津布鲁克斯学院）', '成都理工大学（成都校区） · 国际教育学院（成都理工大学牛津布鲁克斯学院）', '四年', '国际教育学院（成都理工大学牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2240, 2024, '会计学（中外合作办学）', '国际教育学院（成都理工大学牛津布鲁克斯学院）', '成都理工大学（成都校区） · 国际教育学院（成都理工大学牛津布鲁克斯学院）', '四年', '国际教育学院（成都理工大学牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2241, 2024, '经济学', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2242, 2024, '投资学', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2243, 2024, '会计学', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2244, 2024, '社会体育指导与管理', '体育学院', '成都理工大学（成都校区） · 体育学院', '四年', '体育学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2245, 2024, '广播电视学', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2246, 2024, '视觉传达设计', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2247, 2024, '休闲体育', '体育学院', '成都理工大学（成都校区） · 体育学院', '四年', '体育学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2248, 2024, '表演', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2249, 2024, '播音与主持艺术', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2250, 2024, '广播电视编导', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
COMMIT;
