/*
  Warnings:

  - You are about to drop the `MatchaBrand` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "MatchaProduct" DROP CONSTRAINT "MatchaProduct_brandId_fkey";

-- DropTable
DROP TABLE "MatchaBrand";

-- CreateTable
CREATE TABLE "matchaBrand" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "brandType" "BrandType" NOT NULL,

    CONSTRAINT "matchaBrand_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "matchaBrand_name_key" ON "matchaBrand"("name");

-- AddForeignKey
ALTER TABLE "MatchaProduct" ADD CONSTRAINT "MatchaProduct_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "matchaBrand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
