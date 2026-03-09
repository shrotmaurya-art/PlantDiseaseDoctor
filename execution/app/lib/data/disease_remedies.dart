const Map<String, Map<String, dynamic>> _diseaseData = {
  // ─── Apple ───────────────────────────────────────────────
  "Apple Scab": {
    "disease_name": "Apple Scab",
    "plant": "Apple",
    "type": "Fungal",
    "severity": "Moderate",
    "description":
        "Apple Scab is a fungal disease caused by Venturia inaequalis. It produces dark, velvety, olive-green to brown scabby lesions on leaves, fruits, and twigs, drastically reducing fruit quality and marketability.",
    "causes": [
      "Cool, moist spring weather",
      "Overwintering spores in fallen leaves",
      "Poor air circulation in the canopy",
    ],
    "organic_remedies": [
      "Remove and destroy all fallen leaves to eliminate overwintering spores",
      "Apply neem oil spray (30ml / 10L water) every 7-10 days from bud break",
      "Sulfur-based organic fungicide applied preventatively",
      "Introduce beneficial fungi like Trichoderma to the soil",
    ],
    "chemical_treatment": [
      "Apply captan or myclobutanil fungicide at bud break (pink stage)",
      "Use mancozeb as a protective spray at 7-day intervals during wet weather",
      "Rotate fungicide classes annually to prevent resistance",
    ],
    "prevention_tips": [
      "Plant scab-resistant apple varieties (Enterprise, Liberty, Redfree)",
      "Prune trees every year to improve air circulation",
      "Rake and bury fallen leaves each autumn",
      "Avoid overhead irrigation; water at the base",
    ],
  },

  "Apple Black Rot": {
    "disease_name": "Black Rot",
    "plant": "Apple",
    "type": "Fungal",
    "severity": "High",
    "description":
        "Black Rot of apple is caused by Botryosphaeria obtusa. It causes circular, brown lesions with concentric rings and dark margins on leaves, and rots the fruit, turning it mummified and black.",
    "causes": [
      "Infected mummified fruit left on the tree",
      "Pruning wounds",
      "Hail damage",
    ],
    "organic_remedies": [
      "Remove and destroy mummified fruits on the tree and ground",
      "Apply copper-based fungicide sprays after pruning",
      "Prune out any fire-blight infected or canker-bearing wood",
    ],
    "chemical_treatment": [
      "Captan + trifloxystrobin combination sprays during bloom",
      "Fenbuconazole (Rally) applied 10-14 day intervals",
    ],
    "prevention_tips": [
      "Maintain proper tree nutrition; calcium applications can reduce infection",
      "Avoid wounding the bark during cultivation",
      "Follow annual sanitation practices",
    ],
  },

  "Apple Cedar Apple Rust": {
    "disease_name": "Cedar Apple Rust",
    "plant": "Apple",
    "type": "Fungal",
    "severity": "Moderate",
    "description":
        "Cedar Apple Rust is caused by Gymnosporangium juniperi-virginianae, requiring both cedar/juniper and apple trees for its complex life cycle. Orange, tube-like structures on cedar trees release spores that infect apple leaves in spring.",
    "causes": [
      "Proximity to eastern red cedar or juniper trees",
      "Wet, warm spring weather",
    ],
    "organic_remedies": [
      "Remove nearby cedar or juniper host trees if feasible",
      "Spray with sulfur or Bordeaux mixture at pink bud stage",
      "Apply copper fungicide on young leaves",
    ],
    "chemical_treatment": [
      "Myclobutanil or propiconazole applied from pink to petal fall stage",
      "Repeat every 7-10 days during wet weather",
    ],
    "prevention_tips": [
      "Plant rust-resistant apple varieties (Redfree, Liberty)",
      "Create physical distance (at least 1 mile) from cedar trees",
      "Monitor both cedar and apple trees in spring",
    ],
  },

  "Cherry Powdery Mildew": {
    "disease_name": "Powdery Mildew",
    "plant": "Cherry",
    "type": "Fungal",
    "severity": "Low to Moderate",
    "description":
        "Powdery Mildew on cherry is caused by Podosphaera clandestina. White, powdery fungal colonies grow on the surface of young leaves, shoot tips, and fruit, causing leaf distortion, premature defoliation, and cracked fruit.",
    "causes": [
      "High humidity combined with warm, dry conditions",
      "Shaded or crowded canopy",
      "Nitrogen excess spurring soft tissue growth",
    ],
    "organic_remedies": [
      "Apply baking soda solution (1 tbsp per liter water) weekly",
      "Spray diluted milk (1:9 ratio) on infected surfaces",
      "Use potassium bicarbonate as a contact fungicide",
      "Neem oil spray every 7-14 days",
    ],
    "chemical_treatment": [
      "Apply myclobutanil (Nova) or trifloxystrobin at first sign",
      "Rotate between sulfur and DMI fungicides to prevent resistance",
    ],
    "prevention_tips": [
      "Plant resistant cherry varieties (Valerian, Regina)",
      "Avoid excess nitrogen fertilization",
      "Ensure open canopy through annual pruning",
      "Water at the base in the morning to reduce humidity",
    ],
  },

  "Cherry Healthy": {
    "disease_name": "Healthy Cherry",
    "plant": "Cherry",
    "type": "None",
    "severity": "None",
    "description":
        "The cherry plant is healthy with no signs of disease or nutrient deficiency.",
    "causes": [],
    "organic_remedies": [
      "Continue current care routine",
      "Apply compost mulch annually",
    ],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Maintain consistent watering",
      "Prune annually in late winter",
    ],
  },

  "Corn Gray Leaf Spot": {
    "disease_name": "Gray Leaf Spot",
    "plant": "Corn (Maize)",
    "type": "Fungal",
    "severity": "High",
    "description":
        "Gray Leaf Spot is a serious foliar disease of corn caused by Cercospora zeae-maydis. Lesions are rectangular, gray to tan, and run between leaf veins, causing severe yield losses in high-humidity environments.",
    "causes": [
      "High humidity and warm temperatures (25-30°C)",
      "Crop residue from prior season",
      "Late-planted corn",
    ],
    "organic_remedies": [
      "Rotate crops: at least 2-year rotation away from corn",
      "Bury or remove crop debris after harvest",
      "Use resistant corn hybrids",
    ],
    "chemical_treatment": [
      "Apply azoxystrobin + propiconazole (Quilt Xcel) at VT/R1 growth stages",
      "Use pyraclostrobin (Headline) for severe infections",
    ],
    "prevention_tips": [
      "Select hybrids rated resistant to GLS",
      "Avoid late planting",
      "Practice minimum 2-year crop rotation",
      "Improve field drainage to reduce humidity",
    ],
  },

  "Corn Common Rust": {
    "disease_name": "Common Rust",
    "plant": "Corn (Maize)",
    "type": "Fungal",
    "severity": "Moderate",
    "description":
        "Common Rust of corn is caused by Puccinia sorghi. It appears as small, circular to elongated, brick-red to chocolate-brown pustules scattered on both leaf surfaces, leading to premature drying of leaves.",
    "causes": [
      "Cool, moist weather (16-23°C)",
      "Airborne spores from tropical nurseries",
    ],
    "organic_remedies": [
      "Plant quickly maturing varieties to avoid high-infection periods",
      "Apply sulfur dust as a protective measure",
    ],
    "chemical_treatment": [
      "Fungicide application is rarely necessary for common rust if resistant hybrids are used",
      "Propiconazole or mancozeb for severe outbreaks",
    ],
    "prevention_tips": [
      "Use resistant or tolerant corn hybrids (this is the most effective control)",
      "Monitor fields weekly from V6 stage",
      "Avoid planting near areas with known rust history",
    ],
  },

  "Corn Northern Leaf Blight": {
    "disease_name": "Northern Leaf Blight",
    "plant": "Corn (Maize)",
    "type": "Fungal",
    "severity": "High",
    "description":
        "Northern Leaf Blight (NLB) is caused by Setosphaeria turcica. Symptoms include large, cigar-shaped gray-green to tan lesions (up to 15 cm long) that can coalesce and kill entire leaves, leading to yield losses of up to 50%.",
    "causes": [
      "Warm and wet conditions (18-27°C)",
      "Crop residue left from prior season",
    ],
    "organic_remedies": [
      "Rotate with non-grass crops for 1 year",
      "Incorporate crop residue after harvest to speed decomposition",
    ],
    "chemical_treatment": [
      "Triazole + strobilurin fungicide mixtures applied at VT stage",
      "Azoxystrobin (Quadris) applications if disease pressure is high",
    ],
    "prevention_tips": [
      "Plant hybrids with NLB resistance rated Ht1 or higher",
      "Apply a 2-year corn-free rotation in fields with heavy residue",
      "Scout fields early for characteristic lesions",
    ],
  },

  "Corn Healthy": {
    "disease_name": "Healthy Corn",
    "plant": "Corn (Maize)",
    "type": "None",
    "severity": "None",
    "description": "The corn plant is healthy and developing normally.",
    "causes": [],
    "organic_remedies": [
      "Apply compost at planting",
      "Use balanced fertilization",
    ],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Maintain proper plant spacing",
      "Scout weekly for early disease signs",
    ],
  },

  "Grape Black Rot": {
    "disease_name": "Black Rot",
    "plant": "Grape",
    "type": "Fungal",
    "severity": "High",
    "description":
        "Grape Black Rot is caused by Guignardia bidwellii. Young leaves show circular, tan lesions with dark margins. Berries shrivel and turn into hard, black, wrinkled mummies. It can destroy entire crops in humid environments.",
    "causes": [
      "Warm, wet spring weather",
      "Mummified berries from last season",
      "Dense vine canopy",
    ],
    "organic_remedies": [
      "Remove all mummified berries from vines and ground",
      "Apply copper hydroxide during early shoot growth",
      "Avoid overhead irrigation",
      "Ensure wide vine row spacing for air flow",
    ],
    "chemical_treatment": [
      "Myclobutanil (Nova) sprays beginning at 2-3 inch shoot growth",
      "Mancozeb as a protective spray every 7-10 days",
    ],
    "prevention_tips": [
      "Prune vines aggressively to reduce canopy density",
      "Remove and destroy all crop debris",
      "Train vines to promote air movement and sun exposure",
    ],
  },

  "Grape Esca Black Measles": {
    "disease_name": "Esca (Black Measles)",
    "plant": "Grape",
    "type": "Fungal (Wood disease)",
    "severity": "High",
    "description":
        "Esca is a destructive trunk disease complex caused by several wood-rot fungi. Leaves show a 'tiger stripe' pattern with chlorosis between veins and necrosis. Berries develop dark spotting and shrivel. Severely affected vines may collapse suddenly in summer.",
    "causes": [
      "Pruning wounds left unprotected",
      "Established wood-rotting fungi (Phaeomoniella, Botryosphaeria)",
      "Drought stress",
    ],
    "organic_remedies": [
      "Apply pruning wound sealants immediately after cutting",
      "Use the double-pruning technique to minimize large wound surfaces",
      "Apply Trichoderma-based bio-fungicide to wounds",
    ],
    "chemical_treatment": [
      "No curative chemical treatment exists within the plant",
      "Benomyl or thiophanate-methyl applied to wounds at pruning",
    ],
    "prevention_tips": [
      "Prune in dry weather and seal all wounds",
      "Remove and burn symptomatic canes and arms",
      "Avoid water stress which makes vines more susceptible",
      "Rejuvenation pruning in early stages can save the vine",
    ],
  },

  "Grape Leaf Blight Isariopsis": {
    "disease_name": "Leaf Blight (Isariopsis)",
    "plant": "Grape",
    "type": "Fungal",
    "severity": "Moderate",
    "description":
        "Grape Leaf Blight is caused by Isariopsis clavispora (now Pseudocercospora vitis). Angular, brown to black lesions develop on older leaves, often surrounded by a yellow halo. Premature defoliation weakens vines.",
    "causes": [
      "Warm, humid late-season weather",
      "Dense canopy reducing air flow",
    ],
    "organic_remedies": [
      "Apply copper-based fungicides preventatively",
      "Ensure canopy is open via shoot thinning and leaf removal",
    ],
    "chemical_treatment": [
      "Mancozeb or chlorothalonil sprays during fruit development",
      "Organic copper fungicides registered for this pathogen",
    ],
    "prevention_tips": [
      "Training systems that promote air circulation",
      "Collect fallen leaves to reduce inoculum",
    ],
  },

  "Grape Healthy": {
    "disease_name": "Healthy Grape",
    "plant": "Grape",
    "type": "None",
    "severity": "None",
    "description": "The grapevine is healthy with no signs of disease.",
    "causes": [],
    "organic_remedies": ["Compost and balanced fertilization"],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Annual pruning and canopy management",
      "Consistent monitor for early symptoms",
    ],
  },

  "Orange Haunglongbing Citrus Greening": {
    "disease_name": "Citrus Greening (HLB)",
    "plant": "Orange / Citrus",
    "type": "Bacterial",
    "severity": "Critical",
    "description":
        "Huanglongbing (HLB) or Citrus Greening is caused by the bacterium Candidatus Liberibacter asiaticus, spread by the Asian Citrus Psyllid. Infected trees show yellowing (blotchy mottle) on leaves, misshapen, bitter green fruit, and gradually die. There is currently no cure.",
    "causes": [
      "Asian Citrus Psyllid (ACP) insect vector",
      "Infected budwood used for propagation",
    ],
    "organic_remedies": [
      "Strict psyllid control with insecticidal soaps and kaolin clay sprays",
      "Trunk injection of micro-nutrient solutions to extend tree life",
      "Remove and destroy infected trees immediately",
    ],
    "chemical_treatment": [
      "Systemic insecticides (imidacloprid) to control ACP vector",
      "Experimental thermotherapy (trunk heating) under research",
    ],
    "prevention_tips": [
      "Use certified disease-free budwood for new plantings",
      "Install ACP monitoring traps throughout the grove",
      "Remove all infected trees and buffer zone trees immediately",
      "Never transport citrus material from infected areas",
    ],
  },

  "Peach Bacterial Spot": {
    "disease_name": "Bacterial Spot",
    "plant": "Peach",
    "type": "Bacterial",
    "severity": "High",
    "description":
        "Bacterial Spot of peach is caused by Xanthomonas arboricola pv. pruni. It causes small, water-soaked spots on leaves that turn dark brown or black, often dropping out leaving a 'shothole' appearance. Fruit shows similar spots that crack and create openings for secondary rot.",
    "causes": [
      "Warm, wet and windy weather",
      "Overhead irrigation",
      "Susceptible peach/nectarine varieties",
    ],
    "organic_remedies": [
      "Copper-based sprays from petal fall every 5-7 days until pit hardening",
      "Avoid overhead watering completely",
      "Prune to improve canopy air flow",
    ],
    "chemical_treatment": [
      "Copper + mancozeb tank-mix applied at green tip through shuck fall",
      "Oxytetracycline (Mycoshield) for resistance management",
    ],
    "prevention_tips": [
      "Plant resistant varieties (Contender, Bisco, Reliance)",
      "Avoid high-nitrogen fertilization that stimulates soft tissue susceptible to disease",
      "Do not plant in frost-prone sites; frost wounds allow bacteria entry",
    ],
  },

  "Peach Healthy": {
    "disease_name": "Healthy Peach",
    "plant": "Peach",
    "type": "None",
    "severity": "None",
    "description":
        "The peach tree is healthy with no visible signs of disease.",
    "causes": [],
    "organic_remedies": ["Apply dormant oil spray in late winter"],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Annual thinning to prevent fruit-load stress",
      "Balanced potassium and calcium nutrition",
    ],
  },

  "Bell Pepper Bacterial Spot": {
    "disease_name": "Bacterial Spot",
    "plant": "Bell Pepper",
    "type": "Bacterial",
    "severity": "High",
    "description":
        "Bacterial Spot of pepper is caused by Xanthomonas species. It causes water-soaked spots on leaves that turn brown with a yellow halo. Severely infected leaves drop, leaving plants defoliated. Fruit shows raised, scabby lesions.",
    "causes": [
      "Warm, wet weather (24-30°C)",
      "Mechanical wounded lesions from wind and sand",
      "Seed-borne bacteria",
    ],
    "organic_remedies": [
      "Use pathogen-free certified seed",
      "Copper-based sprays applied preventatively every 5-7 days",
      "Avoid working in the field when plants are wet",
    ],
    "chemical_treatment": [
      "Copper hydroxide or copper sulfate sprays",
      "Acibenzolar-S-methyl (Actigard) to induce systemic resistance",
    ],
    "prevention_tips": [
      "Rotate peppers with non-solanaceous crops for 2-3 years",
      "Select resistant hybrid varieties",
      "Sanitize tools and equipment between rows",
    ],
  },

  "Bell Pepper Healthy": {
    "disease_name": "Healthy Pepper",
    "plant": "Bell Pepper",
    "type": "None",
    "severity": "None",
    "description": "The pepper plant is healthy.",
    "causes": [],
    "organic_remedies": ["Regular compost applications"],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Stake plants to prevent stem damage",
      "Use drip irrigation",
    ],
  },

  "Potato Early Blight": {
    "disease_name": "Early Blight",
    "plant": "Potato",
    "type": "Fungal",
    "severity": "Moderate to High",
    "description":
        "Potato Early Blight is caused by Alternaria solani. It forms dark-brown, target-like concentric lesions on lower, older leaves first. The disease progresses upward during warm, wet conditions, causing severe defoliation and yield reduction.",
    "causes": [
      "Warm temperatures (24-29°C) with alternating wet and dry periods",
      "Over-mature or stressed plants",
    ],
    "organic_remedies": [
      "Apply copper Bordeaux mixture at first sign of symptoms",
      "Use biofungicides containing Bacillus subtilis (e.g., Serenade)",
      "Remove and destroy affected lower leaves early",
    ],
    "chemical_treatment": [
      "Chlorothalonil (Bravo) applications every 7-10 days",
      "Azoxystrobin + tebuconazole (Elatus) for better systemic control",
    ],
    "prevention_tips": [
      "Plant certified disease-free seed potatoes",
      "Rotate potatoes on a 3-year cycle",
      "Avoid excessive nitrogen fertilization",
      "Maintain adequate soil potassium for plant strength",
    ],
  },

  "Potato Late Blight": {
    "disease_name": "Late Blight",
    "plant": "Potato",
    "type": "Oomycete (Water Mould)",
    "severity": "Critical",
    "description":
        "Potato Late Blight, caused by Phytophthora infestans, was responsible for the Irish Famine. Infected leaves show irregular, water-soaked, pale green lesions that rapidly turn dark brown or black, with white sporulation on the underside in humid conditions. It can kill a field in days.",
    "causes": [
      "Cool, wet conditions (10-21°C), especially at night",
      "Periods of high humidity (>90% RH)",
      "Infected seed tubers",
    ],
    "organic_remedies": [
      "Remove infected plants immediately and destroy them away from the field",
      "Apply copper Bordeaux mixture as a preventative spray every 5-7 days",
      "Use blight-resistant varieties as the primary defense",
    ],
    "chemical_treatment": [
      "Fluopicolide + propamocarb (Infinito) for systemic, curative action",
      "Mandipropamid (Revus) applied preventatively in 5-7 day intervals",
      "Rotate between different fungicide classes to prevent resistance",
    ],
    "prevention_tips": [
      "Plant only certified, pathogen-free seed potatoes",
      "Plant resistant varieties (e.g., Cara, Orla, Sarpo Mira)",
      "Provide good field drainage and row spacing",
      "Monitor blight forecasting alerts (e.g., BlightWatch)",
    ],
  },

  "Potato Healthy": {
    "disease_name": "Healthy Potato",
    "plant": "Potato",
    "type": "None",
    "severity": "None",
    "description": "The potato plant appears healthy.",
    "causes": [],
    "organic_remedies": ["Hilling soil around stems to encourage tuber growth"],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Water consistently at the base",
      "Inspect weekly for late blight in humid months",
    ],
  },

  "Raspberry Healthy": {
    "disease_name": "Healthy Raspberry",
    "plant": "Raspberry",
    "type": "None",
    "severity": "None",
    "description": "The raspberry cane is healthy and growing vigorously.",
    "causes": [],
    "organic_remedies": ["Apply compost mulch around canes"],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Prune out old floricanes after fruiting",
      "Ensure good soil drainage",
    ],
  },

  "Soybean Healthy": {
    "disease_name": "Healthy Soybean",
    "plant": "Soybean",
    "type": "None",
    "severity": "None",
    "description": "The soybean plant appears healthy.",
    "causes": [],
    "organic_remedies": ["Apply rhizobium inoculant to seed at planting"],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Maintain appropriate plant population",
      "Control weeds early",
    ],
  },

  "Squash Powdery Mildew": {
    "disease_name": "Powdery Mildew",
    "plant": "Squash / Cucurbit",
    "type": "Fungal",
    "severity": "Moderate",
    "description":
        "Powdery Mildew on squash is caused by Podosphaera xanthii and Erysiphe cichoracearum. A white, powdery fungal growth appears on the upper leaf surface. Severely infected leaves yellow and die, reducing photosynthesis and fruit yield.",
    "causes": [
      "Warm days and cool nights with high humidity",
      "Plants under drought or shading stress",
    ],
    "organic_remedies": [
      "Apply potassium bicarbonate spray",
      "Spray diluted milk solution (1:10 with water)",
      "Neem oil spray every 7 days as preventive",
    ],
    "chemical_treatment": [
      "Myclobutanil or trifloxystrobin applied at first symptoms",
      "Sulfur fungicide applied every 7-14 days",
    ],
    "prevention_tips": [
      "Choose powdery mildew resistant squash varieties",
      "Ensure wide plant spacing",
      "Avoid overheard irrigation",
      "Remove severely infected leaves promptly",
    ],
  },

  "Strawberry Leaf Scorch": {
    "disease_name": "Leaf Scorch",
    "plant": "Strawberry",
    "type": "Fungal",
    "severity": "Moderate",
    "description":
        "Leaf Scorch of strawberry is caused by Diplocarpon earlianum. Dark purple to brown irregular lesions appear on the leaf surface, eventually causing the entire leaf margin to appear scorched, brown, and dead.",
    "causes": [
      "Warm, humid conditions",
      "Wet leaf surfaces from overhead watering or rain",
      "Infected planting material",
    ],
    "organic_remedies": [
      "Remove and destroy infected leaves",
      "Apply copper-based fungicides in spring at leaf emergence",
      "Avoid overhead irrigation; use drip system",
    ],
    "chemical_treatment": [
      "Captan spray in early spring and after renovation",
      "Myclobutanil applications during wet, warm periods",
    ],
    "prevention_tips": [
      "Plant certified disease-free strawberry crowns",
      "Renovate beds after harvest by removing old foliage",
      "Maintain good air circulation between rows",
    ],
  },

  "Strawberry Healthy": {
    "disease_name": "Healthy Strawberry",
    "plant": "Strawberry",
    "type": "None",
    "severity": "None",
    "description": "The strawberry plant is healthy and fruiting well.",
    "causes": [],
    "organic_remedies": ["Mulch with straw to prevent fruit soil contact"],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Renovate after harvest",
      "Control weeds throughout the season",
    ],
  },

  // ─── Tomato ───────────────────────────────────────────────
  "Tomato Bacterial Spot": {
    "disease_name": "Bacterial Spot",
    "plant": "Tomato",
    "type": "Bacterial",
    "severity": "High",
    "description":
        "Tomato Bacterial Spot is caused by Xanthomonas species. Small, water-soaked spots appear on leaves and fruits. Leaf spots turn brown and fall out ('shothole'), while fruit spots are raised, brown, and scabby, significantly reducing marketability.",
    "causes": [
      "Warm, wet and humid conditions (24-30°C)",
      "Overhead irrigation",
      "Seed-borne or transplant-borne bacteria",
    ],
    "organic_remedies": [
      "Use copper-based sprays every 5-7 days starting at transplant",
      "Avoid overhead irrigation; switch to drip lines",
      "Use only certified pathogen-free seed",
    ],
    "chemical_treatment": [
      "Copper hydroxide or copper octanoate sprays",
      "Acibenzolar-S-methyl (Actigard) as systemic inducer",
    ],
    "prevention_tips": [
      "Plant resistant varieties where available",
      "Rotate tomatoes on a 2-3 year cycle",
      "Sanitize tools, poles, and stakes between rows",
    ],
  },

  "Tomato Early Blight": {
    "disease_name": "Early Blight",
    "plant": "Tomato",
    "type": "Fungal",
    "severity": "High",
    "description":
        "Tomato Early Blight, caused by Alternaria solani, forms distinctive target-like concentric-ring lesions on older lower leaves first. It progresses up the plant, causing defoliation and exposing fruit to sunscald. It is one of the most common tomato diseases worldwide.",
    "causes": [
      "Alternating wet and dry conditions",
      "Infected crop residue from previous season",
      "Overcrowded plants with poor air circulation",
    ],
    "organic_remedies": [
      "Stake and prune plants to improve air circulation",
      "Remove infected lower leaves immediately and destroy them",
      "Apply copper Bordeaux mixture every 7-10 days",
      "Use biofungicide with Bacillus subtilis (Serenade)",
    ],
    "chemical_treatment": [
      "Chlorothalonil + tebuconazole every 7-10 days",
      "mancozeb applied as a protectant early in the season",
    ],
    "prevention_tips": [
      "Stake and string plants to minimize contact with soil",
      "Mulch around the base to prevent soil splash",
      "Water at the base in the morning only",
      "Practice 2-year crop rotation with non-solanaceous plants",
    ],
  },

  "Tomato Late Blight": {
    "disease_name": "Late Blight",
    "plant": "Tomato",
    "type": "Oomycete",
    "severity": "Critical",
    "description":
        "Tomato Late Blight is caused by Phytophthora infestans. It produces irregular, water-soaked, dark lesions on leaves, stems and fruits. White sporulation is visible under wet conditions. It can destroy a crop within days in cool, wet weather.",
    "causes": [
      "Night temps 10-13°C and daytime humidity >90%",
      "Prolonged leaf wetness from rain or dew",
    ],
    "organic_remedies": [
      "Remove and destroy infected tissue immediately",
      "Apply copper Bordeaux mixture every 5-7 days as preventive",
    ],
    "chemical_treatment": [
      "Metalaxyl + chlorothalonil (Ridomil Gold Bravo)",
      "Dimethomorph + mancozeb (Acrobat) for systemic control",
    ],
    "prevention_tips": [
      "Plant resistant varieties (Mountain Magic F1, Defiant F1)",
      "Avoid wetting the foliage; use drip irrigation",
      "Monitor blight forecasting services",
      "Destroy infected plant material offsite - do not compost",
    ],
  },

  "Tomato Leaf Mold": {
    "disease_name": "Leaf Mold",
    "plant": "Tomato",
    "type": "Fungal",
    "severity": "Moderate",
    "description":
        "Tomato Leaf Mold is caused by Passalora fulva (formerly Cladosporium fulvum). Upper leaf surfaces show pale green-yellow spots while the lower surface develops an olive-brown velvety mold. Severe infection causes leaf drying and premature defoliation, predominantly in greenhouse tomatoes.",
    "causes": [
      "High humidity (>85%)",
      "Poor ventilation especially in greenhouses",
      "Warm temperatures (21-24°C)",
    ],
    "organic_remedies": [
      "Increase greenhouse ventilation significantly",
      "Apply sulfur-based sprays every 7 days",
      "Remove and destroy affected leaves promptly",
    ],
    "chemical_treatment": [
      "Copper fungicides or chlorothalonil applied preventively",
      "Azoxystrobin (Quadris) for curative action",
    ],
    "prevention_tips": [
      "Plant resistant varieties (Jumbo Jim, Elin F1)",
      "Maintain greenhouse humidity below 85%",
      "Space plants widely and use vertical-training systems",
    ],
  },

  "Tomato Septoria Leaf Spot": {
    "disease_name": "Septoria Leaf Spot",
    "plant": "Tomato",
    "type": "Fungal",
    "severity": "High",
    "description":
        "Septoria Leaf Spot is caused by Septoria lycopersici. Small, circular spots with a dark border and light gray or white center with tiny dark spore-producing bodies (pycnidia) inside. Infected leaves turn yellow and drop, starting from the bottom of the plant.",
    "causes": [
      "Warm, wet weather",
      "Infected crop debris from previous season",
      "Overhead irrigation",
    ],
    "organic_remedies": [
      "Remove infected leaves and destroy them",
      "Use copper or Bordeaux mixture sprays weekly",
      "Stake plants to keep foliage above soil level",
    ],
    "chemical_treatment": [
      "Chlorothalonil (Bravo) applied every 7-10 days",
      "Mancozeb for protective action before disease onset",
    ],
    "prevention_tips": [
      "Rotate with non-solanaceous crops (corn, beans, brassicas)",
      "Mulch to prevent soil splash",
      "Water at the base early in the day",
    ],
  },

  "Tomato Spider Mites Two Spotted Spider Mite": {
    "disease_name": "Spider Mites (Two-Spotted)",
    "plant": "Tomato",
    "type": "Pest (Arachnid)",
    "severity": "High",
    "description":
        "Two-Spotted Spider Mite (Tetranychus urticae) causes stippling and bronzing of leaves. Fine webbing is visible under the leaves. Severe infestations cause leaf yellowing, drying, and plant death. They thrive in hot, dry conditions.",
    "causes": [
      "Hot and dry weather",
      "Dusty conditions that suppress natural predators",
      "Overuse of broad-spectrum pesticides",
    ],
    "organic_remedies": [
      "Spray with strong jets of water to knock off mites",
      "Apply insecticidal soap or neem oil every 5-7 days",
      "Introduce predatory mites (Phytoseiulus persimilis) as biological control",
    ],
    "chemical_treatment": [
      "Abamectin (Agri-Mek) applied to under-leaf surface",
      "Bifenazate (Acramite) for conventional control",
    ],
    "prevention_tips": [
      "Avoid broad-spectrum insecticides that kill natural predator mites",
      "Maintain adequate soil moisture; mites thrive in drought-stressed plants",
      "Monitor with 10x hand lens starting at early season",
    ],
  },

  "Tomato Target Spot": {
    "disease_name": "Target Spot",
    "plant": "Tomato",
    "type": "Fungal",
    "severity": "Moderate to High",
    "description":
        "Target Spot of tomato is caused by Corynespora cassiicola. Circular lesions with concentric rings (target-like) form on leaves, stems and fruit. Similar to early blight but can affect all plant parts including green fruit.",
    "causes": ["Warm, humid conditions (20-30°C)", "Prolonged leaf wetness"],
    "organic_remedies": [
      "Improve canopy ventilation by removing excess foliage",
      "Apply copper hydroxide fungicide preventively",
    ],
    "chemical_treatment": [
      "Fluxapyroxad + azoxystrobin (Priaxor) applied at first sign of disease",
      "Boscalid (Endura) for proven efficacy against Corynespora",
    ],
    "prevention_tips": [
      "Rotate with non-host crops",
      "Avoid excessive nitrogen that promotes dense, wet canopies",
      "Use drip irrigation",
    ],
  },

  "Tomato Mosaic Virus": {
    "disease_name": "Tomato Mosaic Virus (ToMV)",
    "plant": "Tomato",
    "type": "Viral",
    "severity": "High",
    "description":
        "Tomato Mosaic Virus causes a mosaic pattern of light/dark green mottling on leaves, which may be distorted or curled. Fruit can show internal browning and reduced yield. The virus is extremely stable and survives on tools, clothing, and plant debris for months.",
    "causes": [
      "Mechanical transmission via hands, tools, or equipment",
      "Infected transplants or seeds",
      "Tobacco products (workers handling tobacco can transmit TMV)",
    ],
    "organic_remedies": [
      "Wash hands thoroughly with soap before handling plants",
      "Remove and destroy infected plants immediately",
      "Disinfect all tools with 10% bleach solution",
    ],
    "chemical_treatment": [
      "No effective chemical treatment for viral diseases",
      "Focus entirely on prevention and vector control",
    ],
    "prevention_tips": [
      "Plant ToMV-resistant varieties (marked Tm-22 gene)",
      "Prohibit smoking near tomato crops",
      "Sanitize tools and hands between plants",
      "Eliminate solanaceous weeds that act as reservoirs",
    ],
  },

  "Tomato Yellow Leaf Curl Virus": {
    "disease_name": "Yellow Leaf Curl Virus (TYLCV)",
    "plant": "Tomato",
    "type": "Viral",
    "severity": "Critical",
    "description":
        "Tomato Yellow Leaf Curl Virus causes yellowing and upward curling of leaves, stunted plant growth, and flower drop, resulting in severely reduced fruit set. It is transmitted by the silverleaf whitefly (Bemisia tabaci) and can cause 100% crop loss if infection occurs early in the season.",
    "causes": [
      "Silverleaf whitefly (Bemisia tabaci) feeding on infected plants",
      "Transplanting infected seedlings",
    ],
    "organic_remedies": [
      "Install reflective mulches to repel whiteflies",
      "Use yellow sticky traps to monitor and catch whitefly populations",
      "Apply insecticidal soap or neem oil to control whitefly nymphs",
      "Introduce Encarsia formosa parasitic wasps as biological control",
    ],
    "chemical_treatment": [
      "Imidacloprid soil drench at transplanting (systemic protection)",
      "Spirotetramat (Movento) foliar spray to target nymph populations",
    ],
    "prevention_tips": [
      "Use TYLCV-resistant varieties (TY-1, TY-2, TY-3 genes)",
      "Install fine mesh insect nets over seedling beds",
      "Scout fields twice weekly for whitefly adults",
      "Establish a 50m tomato-free buffer zone around vulnerable fields",
    ],
  },

  "Tomato Healthy": {
    "disease_name": "Healthy Tomato",
    "plant": "Tomato",
    "type": "None",
    "severity": "None",
    "description":
        "The tomato plant is healthy with excellent foliage and normal fruit development.",
    "causes": [],
    "organic_remedies": [
      "Regular applications of compost tea",
      "Foliar micro-nutrient spray",
    ],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Stake or cage plants for support",
      "Maintain consistent watering to prevent blossom-end rot",
      "Scout weekly for pests and early disease signs",
    ],
  },

  // ─── Fallback ─────────────────────────────────────────────
  "Healthy": {
    "disease_name": "Healthy Plant",
    "plant": "General",
    "type": "None",
    "severity": "None",
    "description":
        "The plant appears healthy with no visible signs of disease, pest infestation, or nutrient deficiency.",
    "causes": [],
    "organic_remedies": [
      "Maintain your current care routine",
      "Apply compost mulch",
    ],
    "chemical_treatment": ["None required"],
    "prevention_tips": [
      "Water at the base in the morning",
      "Ensure good air circulation around plants",
      "Scout weekly for early disease or pest signs",
    ],
  },

  "Unknown": {
    "disease_name": "Unidentified Condition",
    "plant": "Unknown",
    "type": "Unknown",
    "severity": "Unknown",
    "description":
        "The AI could not identify the disease with sufficient confidence. This may be because the image quality is low, the leaf is partially visible, or it is a condition not covered in the training data. Please re-scan with a clearer, closer photo of the leaf.",
    "causes": ["Insufficient image data for classification"],
    "organic_remedies": [
      "Isolate the plant from others as a precaution",
      "Check leaf surfaces (top and bottom) for visible insects or fungal growth",
      "Collect a sample and consult a local agricultural extension office",
    ],
    "chemical_treatment": [
      "Do not apply chemicals until the disease is properly identified",
    ],
    "prevention_tips": [
      "Try re-scanning with better lighting and a focused, close-up photo",
      "Contact a local agronomist or plant doctor for on-site diagnosis",
    ],
  },
};

class DiseaseRemedies {
  static Map<String, Map<String, dynamic>> get data => _diseaseData;
}
