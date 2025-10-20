/*
  Warnings:

  - Made the column `tag` on table `Talk` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Talk" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "title" TEXT NOT NULL,
    "speaker" TEXT NOT NULL,
    "description" TEXT,
    "longDescription" TEXT,
    "year" INTEGER NOT NULL,
    "tag" TEXT NOT NULL,
    "conference" TEXT NOT NULL,
    "duration" INTEGER,
    "videoUrl" TEXT,
    "slides" TEXT
);
INSERT INTO "new_Talk" ("conference", "createdAt", "description", "duration", "id", "longDescription", "slides", "speaker", "tag", "title", "videoUrl", "year") SELECT "conference", "createdAt", "description", "duration", "id", "longDescription", "slides", "speaker", "tag", "title", "videoUrl", "year" FROM "Talk";
DROP TABLE "Talk";
ALTER TABLE "new_Talk" RENAME TO "Talk";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
