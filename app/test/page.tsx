import { getMatchaBrands } from "@/app/lib/queries/matcha";

export default async function TestPage() {
  const brands = await getMatchaBrands();

  return (
    <div style={{ padding: 20 }}>
      <h1>Supabase Test</h1>
      <pre>{JSON.stringify(brands, null, 2)}</pre>
    </div>
  );
}
