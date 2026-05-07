-- HandFive - Supabase Schema
-- Ejecutar este SQL en el SQL Editor de tu proyecto Supabase

-- Tabla de contactos (formulario de contacto)
CREATE TABLE IF NOT EXISTS contacts (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  email text NOT NULL,
  project_type text,
  message text NOT NULL,
  lang text DEFAULT 'es',
  created_at timestamptz DEFAULT now()
);

-- Tabla de cotizaciones (calculador de costos)
CREATE TABLE IF NOT EXISTS quotes (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  project_type text NOT NULL,
  complexity text NOT NULL,
  estimated_range text NOT NULL,
  email text,
  created_at timestamptz DEFAULT now()
);

-- Row Level Security: solo permitir INSERT desde el frontend
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;
ALTER TABLE quotes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anonymous inserts on contacts"
  ON contacts FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow anonymous inserts on quotes"
  ON quotes FOR INSERT
  TO anon
  WITH CHECK (true);
