import { supabase } from "../supabase";

export async function getMatchaBrands() {
  const { data, error } = await supabase
    .from("matcha_brands")
    .select(`
      id,
      name,
      brand_type,
      matcha_products (
        id,
        name,
        grade
      )
    `);

  if (error) throw error;
  return data;
}
