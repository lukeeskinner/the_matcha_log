/*
  Warnings:

  - You are about to drop the column `date` on the `Review` table. All the data in the column will be lost.
  - Changed the type of `brandId` on the `MatchaProduct` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "MatchaProduct" DROP COLUMN "brandId",
ADD COLUMN     "brandId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Review" DROP COLUMN "date",
ADD COLUMN     "consumedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "notes" DROP NOT NULL;

-- CreateTable
CREATE TABLE "MatchaBrand" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "brandType" "BrandType" NOT NULL,

    CONSTRAINT "MatchaBrand_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "MatchaBrand_name_key" ON "MatchaBrand"("name");

-- CreateIndex
CREATE UNIQUE INDEX "MatchaProduct_brandId_name_key" ON "MatchaProduct"("brandId", "name");

-- AddForeignKey
ALTER TABLE "MatchaProduct" ADD CONSTRAINT "MatchaProduct_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "MatchaBrand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
