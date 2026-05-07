import es from './es.json';
import en from './en.json';

export type Lang = 'es' | 'en';
export const defaultLang: Lang = 'es';
export const languages = { es: 'ES', en: 'EN' } as const;

const dictionaries = { es, en } as const;

export function t(lang: Lang = defaultLang) {
  return dictionaries[lang];
}
