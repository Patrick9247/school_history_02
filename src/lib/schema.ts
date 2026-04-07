import { pgTable, serial, text, integer, timestamp, index } from 'drizzle-orm/pg-core';

export const professionalHistory = pgTable(
  'professional_history',
  {
    id: serial('id').primaryKey(),
    year: integer('year').notNull(), // 年份
    major: text('major').notNull(), // 专业名称
    category: text('category'), // 专业类别
    description: text('description'), // 描述
    level: text('level'), // 层级（本科/专科等）
    department: text('department'), // 部门/学院
    createdAt: timestamp('created_at').defaultNow(),
    updatedAt: timestamp('updated_at').defaultNow(),
  },
  (table) => ({
    yearIdx: index('year_idx').on(table.year),
    majorIdx: index('major_idx').on(table.major),
  })
);

export type ProfessionalHistory = typeof professionalHistory.$inferSelect;
export type NewProfessionalHistory = typeof professionalHistory.$inferInsert;
