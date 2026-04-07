BEGIN;
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1901, 2020, '财务管理', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1902, 2020, '投资学', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1903, 2020, '市场营销', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1904, 2020, '通信工程', '机电工程学院', '成都理工大学（成都校区） · 信息科学与技术学院（网络安全学院、牛津布鲁克斯学院）', '四年', '信息科学与技术学院（网络安全学院、牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1905, 2020, '会计学（中外合作办学）', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1906, 2020, '会计学', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1907, 2020, '电子信息工程', '机电工程学院', '成都理工大学（成都校区） · 信息科学与技术学院（网络安全学院、牛津布鲁克斯学院）', '四年', '信息科学与技术学院（网络安全学院、牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1908, 2020, '信息工程', '机电工程学院', '成都理工大学（成都校区） · 信息科学与技术学院（网络安全学院、牛津布鲁克斯学院）', '四年', '信息科学与技术学院（网络安全学院、牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1909, 2020, '社会体育指导与管理', '体育学院', '成都理工大学（成都校区） · 体育学院', '四年', '体育学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1910, 2020, '休闲体育', '体育学院', '成都理工大学（成都校区） · 体育学院', '四年', '体育学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1911, 2020, '广告学', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1912, 2020, '视觉传达设计', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1913, 2020, '表演', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1914, 2020, '播音与主持艺术', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1915, 2020, '广播电视编导', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1916, 2020, '广播电视学', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1917, 2021, '计算机科学与技术（中外合作办学）', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1918, 2021, '人力资源管理', '管理科学学院', '成都理工大学（成都校区） · 管理科学学院', '四年', '管理科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1919, 2021, '思想政治教育', '马克思主义学院', '成都理工大学（成都校区） · 马克思主义学院', '四年', '马克思主义学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1920, 2021, '软件工程（中外合作办学）', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1921, 2021, '软件工程', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1922, 2021, '智能科学与技术', '物理学院', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1923, 2021, '资源勘查工程', '能源学院（页岩气现代产业学院）', '成都理工大学（成都校区） · 能源学院', '四年', '能源学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1924, 2021, '网络空间安全', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1925, 2021, '物联网工程', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1926, 2021, '油气储运工程', '能源学院（页岩气现代产业学院）', '成都理工大学（成都校区） · 能源学院', '四年', '能源学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1927, 2021, '计算机科学与技术', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1928, 2021, '工商管理（中外合作办学）', '管理科学学院', '成都理工大学（成都校区） · 管理科学学院', '四年', '管理科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1929, 2021, '新能源科学与工程', '能源学院（页岩气现代产业学院）', '成都理工大学（成都校区） · 能源学院', '四年', '能源学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1930, 2021, '石油工程', '能源学院（页岩气现代产业学院）', '成都理工大学（成都校区） · 能源学院', '四年', '能源学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1931, 2021, '数字媒体技术', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1932, 2021, '人工智能', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1933, 2021, '工商管理', '管理科学学院', '成都理工大学（成都校区） · 管理科学学院', '四年', '管理科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1934, 2021, '大数据管理与应用', '管理科学学院', '成都理工大学（成都校区） · 管理科学学院', '四年', '管理科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1935, 2021, '电子商务', '管理科学学院', '成都理工大学（成都校区） · 管理科学学院', '四年', '管理科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1936, 2021, '物流管理', '管理科学学院', '成都理工大学（成都校区） · 管理科学学院', '四年', '管理科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1937, 2021, '环境科学与工程', '生态环境学院', '成都理工大学（成都校区） · 生态环境学院', '四年', '生态环境学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1938, 2021, '信息工程', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1939, 2021, '环境生态工程', '生态环境学院', '成都理工大学（成都校区） · 生态环境学院', '四年', '生态环境学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1940, 2021, '环境工程', '生态环境学院', '成都理工大学（成都校区） · 生态环境学院', '四年', '生态环境学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1941, 2021, '工程管理', '环境与土木工程学院', '成都理工大学（成都校区） · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1942, 2021, '工程力学', '环境与土木工程学院', '成都理工大学（成都校区） · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1943, 2021, '城市地下空间工程', '环境与土木工程学院', '成都理工大学（成都校区） · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1944, 2021, '地质工程', '环境与土木工程学院', '成都理工大学（成都校区） · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1945, 2021, '土木工程', '环境与土木工程学院', '成都理工大学（成都校区） · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1946, 2021, '工业设计', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1947, 2021, '地下水科学与工程', '环境与土木工程学院', '成都理工大学（成都校区） · 环境与土木工程学院', '四年', '环境与土木工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1948, 2021, '辐射防护与核安全', '核技术与自动化工程学院', '成都理工大学（成都校区） · 核技术与自动化工程学院', '四年', '核技术与自动化工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1949, 2021, '电气工程及其自动化', '核技术与自动化工程学院', '成都理工大学（成都校区） · 核技术与自动化工程学院', '四年', '核技术与自动化工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1950, 2021, '测控技术与仪器', '核技术与自动化工程学院', '成都理工大学（成都校区） · 核技术与自动化工程学院', '四年', '核技术与自动化工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1951, 2021, '核工程与核技术', '核技术与自动化工程学院', '成都理工大学（成都校区） · 核技术与自动化工程学院', '四年', '核技术与自动化工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1952, 2021, '机械工程', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1953, 2021, '材料科学与工程', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院', '四年', '材料与化学化工学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1954, 2021, '新能源材料与器件', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院', '四年', '材料与化学化工学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1955, 2021, '应用化学', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院', '四年', '材料与化学化工学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1956, 2021, '化学工程与工艺', '材料与化学化工学院（锂资源与锂电产业学院）', '成都理工大学（成都校区） · 材料与化学化工学院', '四年', '材料与化学化工学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1957, 2021, '通信工程', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1958, 2021, '风景园林', '地理与规划学院', '成都理工大学（成都校区） · 旅游与城乡规划学院', '五年', '旅游与城乡规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1959, 2021, '电子信息工程', '机电工程学院', '成都理工大学（成都校区） · 机电工程学院', '四年', '机电工程学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1960, 2021, '旅游管理', '地理与规划学院', '成都理工大学（成都校区） · 旅游与城乡规划学院', '四年', '旅游与城乡规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1961, 2021, '法学', '文法学院（纪检监察学院）', '成都理工大学（成都校区） · 文法学院', '四年', '文法学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1962, 2021, '人文地理与城乡规划', '地理与规划学院', '成都理工大学（成都校区） · 旅游与城乡规划学院', '四年', '旅游与城乡规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1963, 2021, '社会学', '文法学院（纪检监察学院）', '成都理工大学（成都校区） · 文法学院', '四年', '文法学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1964, 2021, '勘查技术与工程', '地球物理学院', '成都理工大学（成都校区） · 地球物理学院', '四年', '地球物理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1965, 2021, '应用物理学', '物理学院', '成都理工大学（成都校区） · 数理学院', '四年', '数理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1966, 2021, '数学与应用数学', '数学科学学院', '成都理工大学（成都校区） · 数理学院', '四年', '数理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1967, 2021, '公共事业管理', '文法学院（纪检监察学院）', '成都理工大学（成都校区） · 文法学院', '四年', '文法学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1968, 2021, '应用统计学', '数学科学学院', '成都理工大学（成都校区） · 数理学院', '四年', '数理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1969, 2021, '信息与计算科学', '数学科学学院', '成都理工大学（成都校区） · 数理学院', '四年', '数理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1970, 2021, '英语', '外国语学院', '成都理工大学（成都校区） · 外国语学院', '四年', '外国语学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1971, 2021, '翻译', '外国语学院', '成都理工大学（成都校区） · 外国语学院', '四年', '外国语学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1972, 2021, '日语', '外国语学院', '成都理工大学（成都校区） · 外国语学院', '四年', '外国语学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1973, 2021, '会计学', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1974, 2021, '商务英语', '外国语学院', '成都理工大学（成都校区） · 外国语学院', '四年', '外国语学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1975, 2021, '资源勘查工程', '地球与行星科学学院', '成都理工大学（成都校区） · 地球科学学院', '四年', '地球科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1976, 2021, '建筑学', '地理与规划学院', '成都理工大学（成都校区） · 地理与规划学院', '五年', '地理与规划学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1977, 2021, '地质学', '地球与行星科学学院', '成都理工大学（成都校区） · 地球科学学院', '四年', '地球科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1978, 2021, '测绘工程', '地球与行星科学学院', '成都理工大学（成都校区） · 地球科学学院', '四年', '地球科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1979, 2021, '地理信息科学', '地理与规划学院', '成都理工大学（成都校区） · 地球科学学院', '四年', '地球科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1980, 2021, '地球化学', '地球与行星科学学院', '成都理工大学（成都校区） · 地球科学学院', '四年', '地球科学学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1981, 2021, '市场营销', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1982, 2021, '空间科学与技术', '地球物理学院', '成都理工大学（成都校区） · 地球物理学院', '四年', '地球物理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1983, 2021, '地球物理学', '地球物理学院', '成都理工大学（成都校区） · 地球物理学院', '四年', '地球物理学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1984, 2021, '财务管理', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1985, 2021, '投资学', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1986, 2021, '经济学', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1987, 2021, '表演', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1988, 2021, '会计学（中外合作办学）', '商学院', '成都理工大学（成都校区） · 商学院', '四年', '商学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1989, 2021, '社会体育指导与管理', '体育学院', '成都理工大学（成都校区） · 体育学院', '四年', '体育学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1990, 2021, '休闲体育', '体育学院', '成都理工大学（成都校区） · 体育学院', '四年', '体育学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1991, 2021, '视觉传达设计', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1992, 2021, '广播电视编导', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1993, 2021, '播音与主持艺术', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1994, 2021, '广播电视学', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1995, 2021, '广告学', '传播科学与艺术学院', '成都理工大学（成都校区） · 传播科学与艺术学院', '四年', '传播科学与艺术学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1996, 2022, '计算机科学与技术', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1997, 2022, '思想政治教育', '马克思主义学院', '成都理工大学（成都校区） · 马克思主义学院', '四年', '马克思主义学院', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1998, 2022, '软件工程（中外合作办学）', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (1999, 2022, '软件工程', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
INSERT INTO professional_history (id, year, major, category, description, level, department, created_at, updated_at)
VALUES (2000, 2022, '计算机科学与技术（中外合作办学）', '计算机与网络安全学院（示范性软件学院）', '成都理工大学（成都校区） · 计算机与网络安全学院（牛津布鲁克斯学院）', '四年', '计算机与网络安全学院（牛津布鲁克斯学院）', NOW(), NOW())
ON CONFLICT (id) DO UPDATE SET year = EXCLUDED.year, major = EXCLUDED.major, category = EXCLUDED.category, description = EXCLUDED.description, level = EXCLUDED.level, department = EXCLUDED.department, updated_at = NOW();
COMMIT;