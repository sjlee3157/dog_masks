using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadUSData : MonoBehaviour
{
    List<DataRow> rows = new List<DataRow>();

    // The prefab for the data points to be instantiated
    public GameObject DataBallPrefab;
    private Transform graphContainer;

    float stepDepth = -10f;
    float joinPlatformLength = 10f; // stepDepth == joinPlatformLength for a square platform

    float graphWidth = 100f;
    float xOffset = 0f; // Should be joinPlatformLength
    float xMaximum = 0f;

    float graphHeight = 100f;
    float yOffset = 0f;
    float yMaximum = 0f;

    // Start is called before the first frame update
    void Start()
    {
        LoadGraph();
        CalculateScale();
        ShowGraph();

        void LoadGraph()
        {
            // TextAssets are READ-ONLY - like a prefab.
            TextAsset unitedStatesAmerica = Resources.Load<TextAsset>("unitedStatesAmerica");
            string[] data = unitedStatesAmerica.text.Split('\n');
            for (int i = 1; i < data.Length - 1; i++)
            {
                string[] csvRow = data[i].Split(',');
                if (csvRow[0] != "")
                {
                    // Grab Column 0 (Year) and Column 2 (Prison population rate) from CSV
                    DataRow r = new DataRow();
                    int.TryParse(csvRow[0], out r.year);
                    int.TryParse(csvRow[2], out r.rate);
                    rows.Add(r);
                }
            }
        }

        void CalculateScale()
        {
            // xOffset = joinPlatformLength - rows[0].year;
            xOffset = -rows[0].year;
            xMaximum = MaxYear();

            // yOffset = 0 - rows[0].rate;
            yOffset = -rows[0].rate;
            yMaximum = MaxRate();

            float MaxYear()
            {
                float max = 0;
                foreach (DataRow r in rows)
                {
                    if (r.year > max)
                    {
                        max = r.year;
                    }
                }
                return max;
            }

            float MaxRate()
            {
                float max = 0;
                foreach (DataRow r in rows)
                {
                    if (r.rate > max)
                    {
                        max = r.rate;
                    }
                }
                return max;
            }
        }

        void ShowGraph()
        {
            // Store previous Vertex 2 and 3 outside of step generating loop
            Vector3 vertex0 = new Vector3(0, 0, 0);
            Vector3 vertex1 = new Vector3(0, 0, stepDepth);

            graphContainer = transform.Find("graphContainer").GetComponent<Transform>();

            // Loop through data to instantiate meshes
            for (int i = 0; i < rows.Count; i++)
            {

                // if (i == -1) {
                //     // float xCoord = joinPlatformLength;
                //     // float yCoord = 0f;

                //     // Debug.Log("GENERATING JOIN PLATFORM");

                //     // GameObject joinPlatform = new GameObject("Join Platform", typeof(MeshRenderer));
                //     // joinPlatform.transform.SetParent(graphContainer);
                //     // MeshFilter filter = joinPlatform.AddComponent<MeshFilter>() as MeshFilter;
                //     // filter.mesh = GenerateJoinPlatformMesh(xCoord, yCoord, stepDepth);
                // } else {
                DataRow r = rows[i];
                float xCoord = ((r.year + xOffset) / xMaximum) * graphWidth;
                float yCoord = ((r.rate + yOffset) / yMaximum) * graphHeight;

                Debug.Log("PLOTTING " + r.year + " : " + r.rate);
                Debug.Log("X COORD: " + xCoord + "; Y COORD: " + yCoord);

                // Instantiate prefab DataBall point
                GameObject dataBall = Instantiate(DataBallPrefab, new Vector3(xCoord, yCoord, 0), Quaternion.identity);
                dataBall.transform.SetParent(graphContainer);

                // Create a new "Step" at each data point
                GameObject newStep = new GameObject("Step " + (i + 1), typeof(MeshRenderer));
                newStep.transform.SetParent(graphContainer);
                MeshFilter filter = newStep.AddComponent<MeshFilter>() as MeshFilter;
                filter.mesh = GenerateStepMesh(xCoord, yCoord, stepDepth);
                // }

                // Mesh GenerateJoinPlatformMesh(float xCoord, float yCoord, float stepDepth) {
                //     Mesh mesh = new Mesh();
                //     mesh.SetVertices(new List<Vector3>() {
                //             vertex0,
                //             vertex1,
                //             new Vector3(xCoord, yCoord, 0),
                //             new Vector3(xCoord, yCoord, stepDepth)
                //         });
                //     mesh.SetTriangles(new List<int>() {
                //             0, 2, 1,
                //             2, 3, 1
                //         }, 0);
                //     mesh.SetNormals(new List<Vector3>() { Vector3.up, Vector3.up, Vector3.up, Vector3.up });
                //     mesh.SetUVs(0, new List<Vector2>() {
                //             new Vector2(0, 0),
                //             new Vector2(1, 0),
                //             new Vector2(0, 1),
                //             new Vector2(1, 1),
                //         });
                //     // Save current vertices for generating the next new Step
                //     Vector3[] vertices = mesh.vertices;
                //     vertex0 = vertices[2];
                //     vertex1 = vertices[3];
                //     return mesh;
                // }


            }

            Mesh GenerateStepMesh(float xCoord, float yCoord, float stepDepth)
            {
                Mesh mesh = new Mesh();
                mesh.SetVertices(new List<Vector3>() {
                            vertex0,
                            vertex1,
                            new Vector3(xCoord, yCoord, 0),
                            new Vector3(xCoord, yCoord, stepDepth)
                        });
                mesh.SetTriangles(new List<int>() {
                            0, 2, 1,
                            2, 3, 1
                        }, 0);
                mesh.SetNormals(new List<Vector3>() { Vector3.up, Vector3.up, Vector3.up, Vector3.up });
                mesh.SetUVs(0, new List<Vector2>() {
                            new Vector2(0, 0),
                            new Vector2(1, 0),
                            new Vector2(0, 1),
                            new Vector2(1, 1),
                        });
                // Save current vertices for generating the next new Step
                Vector3[] vertices = mesh.vertices;
                vertex0 = vertices[2];
                vertex1 = vertices[3];

                return mesh;
            }
        }
    }

    // Update is called once per frame
    void Update()
    {

    }
}
